float GRAVITY = 4;
float FRICTION = 0.85;

public class ball {
  float x,y;
  float spx,spy;
  float radius;
  color ball_color;
  color center_color;
  float ballsize;
  
  ball(
    float _x,float _y,
    float _spx,float _spy,
    float _radius,
    color _ball_color) {
      x  = _x;
      y  = _y;
      spx = _spx;
      spy = _spy;
      radius = _radius;
      ball_color = _ball_color;
    }
    
    public void move() {
      spx *= FRICTION;
      spy *= FRICTION;
      if (x>width/2){
        spx -= GRAVITY;
      }else{
        spx += GRAVITY;
      }
      if (y>height/2){
        spy -= GRAVITY;
      }else{
        spy += GRAVITY;
      }
        x    += spx;
        y    += spy;
        this.bounce();
      }

    public void draw() {
      fill(ball_color);
      ellipse(x,y,radius*2*ballsize,radius*2*ballsize);
      fill(center_color);
      ellipse(x,y,radius*ballsize,radius*ballsize);
    }

    public void hit(float sx,float sy){
      spx = sx;
      spy = sy;
    }
    public void vol(float value){
      center_color = color(value*255,value*255,value*255);
      ballsize = value*2+0.5;
    }
    
    private void bounce() {
      float bounceMinX = radius;
      float bounceMaxX = width - radius;
      float bounceMaxY = height - radius;
      
      if(x < bounceMinX || x > bounceMaxX){
        spx= -spx * FRICTION;
        if(x < bounceMinX) x=bounceMinX - (x-bounceMinX);
        if(x > bounceMaxX) x=bounceMaxX - (x-bounceMaxX);
      }
      
      if(y > bounceMaxY){
        spy= -spy * FRICTION*0.7;
        if(y >bounceMaxY) y=bounceMaxY - (y-bounceMaxY);
      }
    }
}
