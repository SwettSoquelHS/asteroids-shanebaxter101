//note that this class does NOT *NEED* to extend Mover but can if you like
class Star {
  float x, y;
  int size;

  Star(float x, float y, int size){
    
    this.x = x;
    this.y = y;
    this.size = size;
  }


  void show() {
    fill(255);
    ellipse(x, y, size, size);
  }
}
