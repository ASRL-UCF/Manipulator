tic;
%created for the trajectory tracking problem
%-------------------------------------------------

% This function takes a generated trajectory with 6 states, x,y,z pos and
% xdot, ydot, zdot velocity. The script extracts all z axis motion and
% generates a trajectory in joint space. The inverse jacobian is used to
% generate a joint velocity command, and using intergration, the joint
% states are generated.


%-------------------------------------------------

%all angle units are in rads


% SERIAL LINK FOR ROBOTICS TOOLBOX BY PETER CORKE: ONLY HERE SO I DONT LOSE
% IT
% 
% L(1) = Link([0 169.77 64.2 -1.5707], 'R');
% L(2) = Link([0 0 305 0], 'R');
% L(3) = Link([-1.5707 0 0 1.5707], 'R');
% L(4) = Link([0 -222.63 0 -1.5707], 'R');
% L(5) = Link([0 0 0 1.5707], 'R');
% L(6) = Link([pi -36.25 0 0], 'R');
% 
% Robot = SerialLink(L);
% Robot.name = 'AR2_Robot';

%-------------------------------------------------
%time of manuever in seconds
t=60;

radToDeg=180/pi;
degToRad=pi/180;

%non-cannotical units
load('refTraj_10inc_expirement.mat');
chi=length(refTraj);

%convert canonical units to mm and mm/s
% refTraj=refTraj;
% 
refTraj(:,2)=refTraj(:,2)*1000;
%initial theta positions at start of maneuver -- find different initial
%angle
theta=cell(chi,1);
theta{1} = (pi/180)*[0;-70;90;0;12;0];

%theta0(3)=theta0(3)-90;
%theta0(6)=theta0(6)+180;


% will need to resize the units
velE_ref = zeros(chi,6);
velE_ref(:,3) = refTraj(:,2);


%timesteps between points
ts=t/chi;

%-------------------------------------------------

tv=zeros(chi,1);
for i=1:t/ts
    tv(i)=ts*i;
end

%calculate joint Velocities
thetad=cell(chi,1);
for i=1:chi
%       Calculate new theta dots
        thetad{i} = trajectoryIK(velE_ref(i,:)',theta{i});
        
        
%       Calculate new theta to feed back
        if i == chi
            break
        end
        
%       IS THIS RIGHT?
        theta{i+1}=theta{i}+(thetad{i}*ts); 
        
end
%-------------------------------------------------

theta=theta';
theta=cell2mat(theta);
theta=theta';

thetad=thetad';
thetad=cell2mat(thetad);
thetad=thetad';

% Converted to Path File Needed For Control.
path=[tv theta thetad];
pathDeg=path;
pathDeg(:,2:end)=path(:,2:end)*180/pi;

% downsample
oL = length(original);
downsampled = interp1(1:oL, original, linspace(1,oL,3000));




validateTrajectory(path)

toc