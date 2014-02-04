void rightPanelDraw(){
  //Right panel background
  imageMode(CORNER);
  image(background, width-300, 0, width, height);
  
  //Right panel instruction
  if(!instruction){
    imageMode(CORNER);
    image(leftClick,970, 65, 32, 40);
    fill(255);
    textSize(14);
    text(" -- pan/navigate", 1005, 90);
    
    image(scroll, 970, 110, 32, 50);
    fill(255);
    textSize(14);
    text(" -- zoom", 1005, 140);  
    
    image(rightClick, 970, 175, 32, 40);
    fill(255);
    textSize(14);
    text(" -- draw", 1005, 195);  
  }

  
  //Right panel display text and line
  stroke(255);
  strokeWeight(2);
  line(1050, 440, 1050, 590);
  
  //Draw title
  textSize(33);
  fill(0);
  text("CAMPUS RUNNER", 918, 44);
  fill(255);
  text("CAMPUS RUNNER", 915, 40);

  
  //Draw interface labels and stats
  textSize(18);
  fill(0);
  text("Distance", 912, 462);
  fill(255);
  text("Distance", 910, 460);
  
  textSize(48);
  fill(0);
  text(nfc(dist_imperial, 1), 933, 548);
  fill(255);
  text(nfc(dist_imperial, 1), 930, 545);
  
  textSize(18);
  fill(0);
  text("miles", 1002, 592);
  fill(255);
  text("miles", 1000, 590);
  
  
  textSize(18);
  fill(0);
  text("Calories", 1062, 462);
  fill(255);
  text("Calories", 1060, 460);
  
  textSize(48);
  fill(0);
  text(int(calories), 1083, 548);
  fill(255);
  text(int(calories), 1080, 545);
  
  textSize(18);
  fill(0);
  text("cal", 1172, 592);
  fill(255);
  text("cal", 1170, 590);
  
  stroke(255);
  strokeWeight(2);
  line(900, 240, 1200, 240);
  line(900, 440, 1200, 440);
  
  textSize(18);
  fill(0);
  text("Elevation Profile", 978, 262);
  fill(255);
  text("Elevation Profile", 975, 260);
  
}


void ResetButton(){
  if(mouseX>width-270
  &mouseX<width-170
  &mouseY>height-50
  &mouseY<height-20
  &mousePressed){
    imgW = campus.width / 4;
    imgH = campus.height /4;
    
    centerX = imgW/2;
    centerY = imgH/2;
    
    lines =  new int[0];
    lineColor = null;
    lineColor = new color[0];
    elev = new int[0];
    gradient = new float[0];
    dist = 0;
    dist_imperial = 0;
    dist_metric = 0;
    calories = 0;
    
    demX = 0;
    demY = 0;

  }
  imageMode(CORNERS);
  image(resetButton, width-270,height-50,width-170, height-20);
  fill(0);
  textSize(15);
  text("RESET", width-242, height-30);
}

void RoadButton(){
  imageMode(CORNERS);
  image(resetButton, width-120,height-50,width-20, height-20);
  fill(0);
  textSize(15);
  if(road){
    text("Hide Road", width-106, height-30);
  }else{
  text("Show Road", width-108, height-30);
  }
}
