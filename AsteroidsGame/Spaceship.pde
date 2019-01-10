/*
  Spaceship class
 Should extend Mover class and implement show.
 You may add additional methods to this class, for example "rotate" and "accelerate" 
 might be useful.
 */
class Spaceship extends Mover {  

  Spaceship(float x, float y) {
    super(x, y);
  }

  Spaceship(float x, float y, float speed, float direction) {
    super(x, y, speed, direction);
  }

  void show() {
    pushMatrix();
    translate(x, y);
    rotate(radians(direction + 270));
    fill(216, 9, 9);
    beginShape();
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
    endShape();
    popMatrix();
  }
}
