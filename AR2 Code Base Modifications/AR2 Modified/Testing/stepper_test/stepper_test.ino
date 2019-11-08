// Bounce.pde
// -*- mode: C++ -*-
//
// Make a single stepper bounce from one limit to another
//
// Copyright (C) 2012 Mike McCauley
// $Id: Random.pde,v 1.1 2011/01/05 01:51:01 mikem Exp mikem $

#include <AccelStepper.h>

// Define a stepper and the pins it will use
AccelStepper stepper(1,2,3);

// This defines the analog input pin for reading the control voltage
// Tested with a 10k linear pot between 5v and GND

void setup()
{  
  // Change these to suit your stepper if you want
  stepper.setMaxSpeed(500);
  stepper.setAcceleration(200);
  stepper.moveTo(1000);
}

void loop()
{
    stepper.run();
}
