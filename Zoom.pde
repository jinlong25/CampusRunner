//Zoom function
void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  
  //Zoom in
  if(e == -1){
    if(scale < 8
    ){
      scale++;
      imgH = int(imgH*(1+zoomFactor));
      imgW = int(imgW*(1+zoomFactor));
      
      int oldCenterX = centerX;
      int oldCenterY = centerY;  
      
      centerX = centerX - int(zoomFactor*(mouseX - centerX));
      centerY = centerY - int(zoomFactor*(mouseY - centerY));
      
      //Calcuate the distance to center of the campus image
      for(int i=0; i<lines.length-1; i=i+2){
        lines[i] = int((lines[i] - oldCenterX)*(1+zoomFactor)
        + centerX);
        lines[i+1] = int((lines[i+1] - oldCenterY)*(1+zoomFactor)
        + centerY);
      }
    }
  }
  
  //Zoom out
  if(e == 1){
    if(scale < 1){
      scale = 1;
    }
    if(scale > 1
    //&centerX <= imgW/2
    ){
      scale--;
      imgH = int(imgH/(1+zoomFactor));
      imgW = int(imgW/(1+zoomFactor));
      
      int oldCenterX = centerX;
      int oldCenterY = centerY;  
      
      centerX = centerX + int((mouseX - centerX) 
      *(zoomFactor/(zoomFactor + 1))); 
      centerY = centerY + int((mouseY - centerY) 
      *(zoomFactor/(zoomFactor + 1)));
      
      for(int i=0; i<lines.length-1; i=i+2){
        lines[i] = int((lines[i] - oldCenterX)/(1+zoomFactor) 
        + centerX);
        lines[i+1] = int((lines[i+1] - oldCenterY)/(1+zoomFactor) 
        + centerY);
      }
    }
  }
}
