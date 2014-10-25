// bridging MAX and Processing
// translated form http://tokyomax.jp/?p=923

// needs oscP5 http://www.sojamo.de/libraries/oscP5/index.html

import oscP5.*;
OscP5 oscP5;
int ballNum = 300;
 

ball[] balls = new ball[ballNum];

void setup(){
  size(500,500);
  colorMode(RGB,ballNum);
  background(ballNum);
  noStroke();
  frameRate(30);
  
  for(int i=0;i<ballNum;i++){
    balls[i] = new ball(width/2,10,random(-20,20),random(-30,0),random(1,10),color(3,3,3));
  }
  
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,7400);
}

void draw(){
  background(240,240, 240);
  
  for(int i=0;i<ballNum;i++){
    balls[i].move();
    balls[i].draw();
  }
}

void mousePressed(){
  for(int i=0;i<ballNum;i++){
    balls[i].hit(random(-50,50),random(-50,50));
  }
}

void oscEvent(OscMessage theOscMessage) {
  float value = theOscMessage.get(0).floatValue();
  if(theOscMessage.checkAddrPattern("/trigger")){
    for(int i=0;i<ballNum;i++){
      balls[i].hit(random(-value*value*50,value*value*50),random(-value*value*50,value*value*50));
    }
  }else if(theOscMessage.checkAddrPattern("/volume")){
    for(int i=0;i<ballNum;i++){
      balls[i].vol(value);
    }
  }
  
   
}
