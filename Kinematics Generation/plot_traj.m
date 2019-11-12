function output=plot_traj(captured,refTraj)
hold off;
chi=length(captured);
oL = length(refTraj);
refTraj= interp1(1:oL, refTraj, linspace(1,oL,chi));
% refTraj=refTraj;

reference=refTraj(:,1);
[lower upper]=bounds(captured);
Scaled_reference=rescale(reference,lower,upper);
plot(captured);
hold on;
plot(Scaled_reference);

% %  Against Time
% hold off;
% tc=60/length(captured);
% tr=60/length(refTraj);
% 
% [lower upper]=bounds(captured);
% refTraj=rescale(refTraj,lower,upper);
% 
% captured(:,2)=captured(:,1);
% for i=1:length(captured(:,1))
% captured(i,1)=tc*i;
% end
% 
% refTraj(:,2)=refTraj(:,1);
% for i=1:length(refTraj(:,1))
% refTraj(i,1)=tr*i;
% end
% 
% plot(captured(:,1),captured(:,2));
% hold on;
% plot(refTraj(:,1),refTraj(:,2));
% 


end