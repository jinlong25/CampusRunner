void mouseDragged() {
  if (mouseButton == LEFT) {
    if(mouseX > 0
    &mouseX < 900
    &mouseY > 0
    &mouseY < 675){
      if(centerX>imgW/2){
        centerX = imgW/2;
      }
      
      if(centerX+imgW/2<900){
        centerX = 900-imgW/2;
      }
      
      if(centerY>imgH/2){
        centerY = imgH/2;
      }
      
      if(centerY+imgH/2<675){
        centerY = 675-imgH/2;
      }
      
      
      panToX = mouseX;
      panToY = mouseY;
      
      xShift = panToX - panFromX; 
      yShift = panToY - panFromY;
      
      centerX = centerX + xShift;
      centerY = centerY + yShift;
      
      panFromX = panToX;
      panFromY = panToY;
      
      if(
      centerX<=imgW/2
      &centerX+imgW/2>=900
      &centerY<=imgH/2
      &centerY+imgH/2>=675
      ){
        for(int i=0; i<lines.length-1; i=i+2){
          lines[i] = lines[i] + xShift;
          lines[i+1] = lines[i+1] + yShift;
        }
      }
      

    }
  } else if (mouseButton == RIGHT) {
    if(mouseX > centerX-imgW/2 
    & mouseX < centerX+imgW/2 
    & mouseY > centerY-imgH/2 
    & mouseY < centerY+imgH/2){
      lines = append(lines, mouseX);
      lines = append(lines, mouseY);
      
      demX = int((mouseX - centerX)/pow((1+zoomFactor), scale-1) + 450);
      demY = int((mouseY - centerY)/pow((1+zoomFactor), scale-1) + 450);

      lineColor = append(lineColor, dem.get(demX, demY));
      lineColor = append(lineColor, dem.get(demX, demY));
      
      //Update the elevation
      color c = dem.get(demX, demY);
      elev = append(elev, int(red(c) + green(c) + blue(c)));
      
      if(elev.length > 5){
        gradient = append(gradient, elev[elev.length-1] 
        - elev[elev.length-6]);
      }
      
      //Update the distance
      dist = dist + sqrt(pow((mouseX - pmouseX), 2) 
      + pow((mouseY - pmouseY), 2))
      /(pow((1+zoomFactor), 
      (scale-1)));
      dist_imperial = dist*0.581/675;
      dist_metric = dist*0.934/675;
    }
      
      //Update calories
      //calories = ((0.35) * 65 + 0.84) * dist_metric;
      if(gender==1){
        calories = ((30*0.2017) + (weight*0.09036) + 148*0.6309-55.0969)*dist_imperial/speed/4.184*60;
      }
      else{
        calories = ((30*0.2017) + (weight*0.09036) + 148*0.6309-55.0969)*dist_imperial/speed/4.184*60;
      }
      
      //Change playback speed
      //##player.speed(heartRate);
      //println(heartRate);
    }    
}
