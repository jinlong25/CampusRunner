Boolean instruction = true;

PImage leftClick;
PImage scroll;
PImage rightClick;


void instructionPage(){
  
  //Set up floating window
  colorMode(RGB);
  rectMode(CORNERS);
  stroke(255,255,255,210);
  fill(255,255,255,210);
  rect(200, 100, width-500, 575);
  
  //Title
  textSize(40);
  colorMode(RGB);
  fill(0,0,0);
  text("Campus Runner", 310+2, 200+2);
  fill(51,105,232);
  text("Campus Runner", 310,200);
  
  fill(51,105,232);
  textSize(12);
  text("by jinlong yang | email: jinlong.yang@mail.sdsu.edu", 300, 565);
  
  //Instruction
  imageMode(CORNER);
  image(leftClick,320, 240, 40, 50);
  fill(51,105,232);
  textSize(18);
  text(" -- Left click to pan/navigate", 360, 270);
  
  image(scroll, 320, 310, 40, 60);
  fill(51,105,232);
  textSize(18);
  text(" -- Scroll the wheel to zoom", 360, 340);  
  
  image(rightClick, 320, 400, 40, 50);
  fill(51,105,232);
  textSize(18);
  text(" -- Right click to draw", 360, 430);  
  
  //Got-it button
  rectMode(CORNERS);
  colorMode(RGB);
  stroke(51,105,232);
  strokeWeight(1);
  fill(51,105,232);
  rect(410-6,492-6,480+6,512+6);
  strokeWeight(1.5);
  stroke(255,255,255);
  fill(255,255,255);
  rect(410-3,492-3,480+3,512+3);
  strokeWeight(1);
  fill(51,105,232);
  rect(410,492,480,512);

  textSize(18);
  fill(255);
  text("Got it!", 420, 508);
  
  if(mouseX>410-6
  &mouseX<480+6
  &mouseY>492-6
  &mouseY<512+6
  &mousePressed){
  instruction = false;
  }
}
