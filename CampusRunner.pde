/*SDSU Campus Runner
Author: Jinlong Yang
Email: jinlong.yang@mail.sdsu.edu
*/

//Import libraries
//import controlP5.*;


//Define sound vars
//##Maxim maxim;


//Define vars for images
PImage campus;
PImage campus_road;
PImage dem;
PImage background;
PImage resetButton;
Boolean road = false;


//Define image vars
int imgW = 900;
int imgH = 675;
int centerX = imgW/2;
int centerY = imgH/2;
int demX;
int demY;


//Define pan/zoom vars
int scale = 1;
float zoomFactor = 0.4;
int panFromX;
int panFromY;
int panToX;
int panToY;
int xShift=0;
int yShift=0;


//Define line vars
int[] lines =  new int[0];
color[] lineColor = new color[0];


//Define elevation vars
int[] elev = new int[0];
float[] gradient = new float[0];


//Define distance vars
float dist = 0;
float dist_imperial = 0;
float dist_metric = 0;
float calories = 0;


//Define audio player vars
//##AudioPlayer player;
//##float heartRate = 0.4;


//Define dropdown menu component
//ControlP5 controlP5;
//DropdownList genderDDL;
//DropdownList weightDDL;
//DropdownList heightDDL;
//DropdownList speedDDL;
int gender=1;
int weight=130;
int userHeight=72;
int speed=5;


//Load data and setup display window
void setup() {
  campus = loadImage("campus.jpg");
  campus_road = loadImage("campus_road.jpg");
  dem = loadImage("campus_dem.jpg");
  background = loadImage("fabric.png");
  resetButton = loadImage("reset_button.png");
  
  leftClick = loadImage("leftClick.png");
  scroll = loadImage("scroll.png");
  rightClick = loadImage("rightClick.png");
  
  imgW = campus.width / 4;
  imgH = campus.height /4;
  
  centerX = imgW/2;
  centerY = imgH/2;
  
  size(imgW + 300, imgH);
  
  //Create dropdown lists for gender, weight, height, and average speed
//  controlP5 = new ControlP5(this);
//  genderDDL = controlP5.addDropdownList("Gender", imgW, 240, 75, 120);
//  genderSetup(genderDDL);
//
//  weightDDL = controlP5.addDropdownList("Weight", imgW + 75, 240, 75, 120);
//  weightSetup(weightDDL);
//  
//  heightDDL = controlP5.addDropdownList("Height", imgW + 150, 240, 75, 150);
//  heightSetup(heightDDL);
//  
//  speedDDL = controlP5.addDropdownList("Speed", imgW + 225, 240, 75, 120);
//  speedSetup(speedDDL);
}


//Happy drawing..:-)
void draw() {
//  //No show of the background
//  if(centerX>imgW/2){
//    centerX = imgW/2;
//  }
//  
//  if(centerX+imgW/2<900){
//    centerX = 900-imgW/2;
//  }
//  
//  if(centerY>imgH/2){
//    centerY = imgH/2;
//  }
//  
//  if(centerY+imgH/2<675){
//    centerY = 675-imgH/2;
//  }
  //Draw images
  imageMode(CENTER);
  //image(background, width/2, height/2, width, height+10);
  background(80);
  image(dem, centerX, centerY, imgW, imgH);
  if(road){
    image(campus_road, centerX, centerY, imgW, imgH);
  }else{
    image(campus, centerX, centerY, imgW, imgH);
  }
  //Draw path
  for(int i=0; i<lines.length - 2; i=i+2){

    float sum = int(red(lineColor[i]) + green(lineColor[i]) + blue(lineColor[i]));
    float hue = map(sum, 0, 255, 120, 0);

    colorMode(HSB);
    stroke(hue, 255, 255);
    strokeWeight(2);
    line(lines[i], lines[i+1], lines[i+2], lines[i+3]);
  }
  
  rightPanelDraw();
  
  //Draw elevation chart
  for(int j=0; j<elev.length - 1; j++){
    float pointXstart = map(j, 0, elev.length, 920, 1200);
    float pointYstart =(300 - elev[j])/3.2;
    
    float pointXend = map(j+1, 0, elev.length, 920, 1200);
    float pointYend = (300 - elev[j+1])/3.2;
    
    float hue = map(elev[j], 0, 255, 96, 2);
    colorMode(HSB);
    stroke(hue, 255, 255);
    strokeWeight(3);
    line(pointXend, pointYend + 675/2, 
    pointXstart, pointYstart + 675/2);
  }
  
  //Legend lines
  stroke(180);
  strokeWeight(1);
  for(int x=925; x<1210; x=x+10){
    line(x, 430, x+5, 430);
  }
  textSize(12);
  text("0(ft)", 902, 433);
  
  stroke(180);
  strokeWeight(1);
  for(int x=945; x<1210; x=x+10){
    line(x, 270, x+5, 270);
  }
  textSize(12);
  text("130(ft)", 902, 275);
  
  
  //Setup reset button
  ResetButton();
  
  //Setup road button
  RoadButton();
 
  
  if(gradient.length>1){
    int lastGradient = gradient.length-1;
    if(gradient[lastGradient]>0){
      //##heartRate = 0.45;
    }
    if(gradient[lastGradient]<0){
      //##heartRate = 0.3;
    }
  }
  
  //Instruction page
  if(instruction){
    instructionPage();
  }
}






void mousePressed() {
  if (mouseButton == LEFT) {
    panFromX = mouseX;
    panFromY = mouseY;
  } else if (mouseButton == RIGHT) {
  //RIGHT CLICK
  //##maxim = new Maxim(this);
//  player = maxim.loadFile("Heartbeat.wav") ;
//  player.setLooping(true);
//  player.volume(1);
//  player.play();
  }
  if(mouseX>width-120
  &mouseX<width-20
  &mouseY>height-50
  &mouseY<height-20
  &mouseButton == LEFT){
    road = !road;
  }
}


void mouseReleased() {
  if (mouseButton == RIGHT) {
//    player.stop();
  }
}
