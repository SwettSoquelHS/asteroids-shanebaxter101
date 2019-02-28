class Bullet extends Mover {

  private int live;

  Bullet(float x, float y) {
    super(x, y);
    live = 100;
  }

  Bullet(float x, float y, float speed, float direction, float size) {
    super(x, y, speed, direction, size);
    live = 100;
  }

  void show() {
    if(live > 0){
      pushMatrix();
      translate(x,y);
      rotate(radians(direction));
      fill(217, 255, 5);
      ellipse(0, 0, size, size);
      popMatrix();
    }
  }

  void update() {
    super.update();
    live--;
  }
  
  boolean isAlive(){
    return false;
  }
  
  int getLive(){
    return live;
  }
  
  void setLive(int n) { live = n; }
}
