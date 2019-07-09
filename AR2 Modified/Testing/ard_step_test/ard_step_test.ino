#include <Stepper.h>
Stepper stepper(4000,2,3);
void setup() {
  // put your setup code here, to run once:
  stepper.setSpeed(0.25);
  
}

void loop() {
  // put your main code here, to run repeatedly:
  stepper.step(1000);
  delay(1100);
  stepper.step(-1000);
  delay(1100);
}
