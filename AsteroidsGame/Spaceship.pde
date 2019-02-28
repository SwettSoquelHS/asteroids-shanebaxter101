

/*
  Spaceship class
 Should extend Mover class and implement show.
 You may add additional methods to this class, for example "rotate" and "accelerate" 
 might be useful.
 */
class Spaceship extends Mover {  
  
  Bullet myBullet;
  ArrayList<Bullet> bullets;

  Spaceship(float x, float y) {
    super(x, y);
    radius = 10;
    bullets = new ArrayList<Bullet>();
  }

  Spaceship(float x, float y, float speed, float direction, float size) {
    super(x, y, speed, direction, size);
    radius = 10;
    bullets = new ArrayList<Bullet>();
  }

  void show() {
    pushMatrix();
    translate(x, y);
    rotate(radians(direction));
    fill(216, 9, 9);
    triangle(-10, -10, -10, 10, 20, 0);
    /*beginShape();
    vertex(5, 0);
    vertex(15, -35);
    vertex(15, -37);
    vertex(17, -37);
    vertex(37, -35);
    vertex(37, -45);
    vertex(17, -52);
    vertex(16, -54);
    vertex(16, -57);
    vertex(17, -59);
    vertex(17, -66);
    vertex(9, -66);
    vertex(9, -59);
    vertex(10, -57);
    vertex(10, -54);
    vertex(9, -52);
    vertex(9, -37);
    vertex(17, -37);
    vertex(9, -37);
    vertex(9, -52);
    vertex(1, -52);
    vertex(1, -37);
    vertex(-12, -37);
    vertex(-32, -35);
    vertex(-32, -45);
    vertex(-12, -52);
    vertex(-11, -54);
    vertex(-11, -57);
    vertex(-12, -59);
    vertex(-12, -66);
    vertex(-4, -66);
    vertex(-4, -59);
    vertex(-5, -57);
    vertex(-5, -54);
    vertex(-4, -52);
    vertex(-4, -37);
    vertex(-10, -37);
    vertex(-10, -35);
    vertex(0, 0);
    vertex(5, 0);
    endShape();*/
    popMatrix();
    
    for(int i=0; i<bullets.size(); i++){
      Bullet b = bullets.get(i);
      if(b != null)
        b.show();
    }
  }

  void hyperspace() {
    this.speed = 0;
    this.x = random(100, 900);
    this.y = random(100, 700);
  }

  void checkCollisions(Asteroid[] a, Spaceship p) {
    for (int i=0; i<a.length; i++) {
      if (p.collidingWith(a[i]) && a[i].getAlive())
        if (speed > 0.5)
          speed = 0.5;
    }
  }

  void fire() {
    if(bullets.size() < 11){
      myBullet = new Bullet(this.x, this.y, this.speed + 2, this.direction, 7);
      bullets.add(myBullet);
    }
  }
  
  void update(){
    super.update();
    for(int i=0; i<bullets.size(); i++){
      Bullet b = bullets.get(i);
      if(b != null)
        b.update();
      if(b.getLive() < 0){
        bullets.remove(b);
      }
    }
  }
  
  boolean hasHitTarget(Asteroid target){
    for(int i=0; i<bullets.size(); i++){
      Bullet b = bullets.get(i);
      if(b.collidingWith(target)){
        target.setAlive(false);
        b.setLive(0);
      }
    }
    return false;
  }
}
