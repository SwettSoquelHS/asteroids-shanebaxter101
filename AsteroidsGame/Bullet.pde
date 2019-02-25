class Bullet extends Mover {

  private int live;

  Bullet(float x, float y) {
    super(x, y);
    live = 100;
  }

  Bullet(float x, float y, float speed, float direction, float size) {
    super(x, y, speed, direction, size);
  }

  void show() {
    if(live > 0){
      pushMatrix();
      translate(x,y);
      rotate(radians(direction));
      ellipse(x, y, 4, 4);
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
}
