/*
  Asteroid class
    Should extend Mover class and implement show.
    
    Initially, your asteroid may just be a simple circle or square
    but the final program should use "beginShap(), vertex(), and endShape()"
    to render the asteroid.
*/
class Asteroid extends Mover {   
  
  boolean alive;
  
  Asteroid(float x, float y){
    super(x, y);
    radius = 15 * size;
    alive = true;
  }
  
  Asteroid(float x, float y, float speed, float direction, float size){
    super(x, y, speed, direction, size);
    radius = 15 * size;
    alive = true;
  }
  
  void show(){
   if(alive){
     pushMatrix();
     translate(x, y);
     rotate(radians(direction));
     fill(152, 152, 152);
     scale(size);
     beginShape();
     vertex(15, 0);
     vertex(10, -5);
     vertex(10, -10);
     vertex(5, -15);
     vertex(-10, -15);
     vertex(-10, -10);
     vertex(-15, -5);
     vertex(-15, 0);
     vertex(-10, 5);
     vertex(-10, 10);
     vertex(-5, 15);
     vertex(0, 15);
     vertex(10, 10);
     vertex(15, 5);
     endShape();
     popMatrix();
   }
  }
  
  void update(){
    super.update();
    float r = random(1, 100);
    
    if(r >= 50)
      direction += 0.5;
    else 
      direction -= 0.5;
  }
  
  void setAlive(boolean b) { alive = b; }
  
  boolean getAlive(){ return alive; }
  
 /* void checkCollision(Asteroid a, Spaceship p){
    if(a.collidingWith(p))
      direction = direction + 180;
  } */
}
