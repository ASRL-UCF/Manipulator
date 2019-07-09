int i=0;
int done;
void setup() {
  // put your setup code here, to run once:
  pinMode(2,OUTPUT);
  pinMode(3,OUTPUT);
  digitalWrite(2, HIGH);
  digitalWrite(3, HIGH);

}
void loop() {
  // put your main code here, to run repeatedly:
  
  done=50000;
  if(i<done)
  {
    digitalWrite(2, LOW);
    delayMicroseconds(5);
    digitalWrite(2, HIGH);
    i++;
    delayMicroseconds(5);
  }

}
