/* * * * * * * * * * * * * * * * * * * * * * *
 Class variable declarations here
 */
Spaceship player1 = new Spaceship(300, 200);
Asteroid[] asteroids;
Star[] starField;


/*
  Track User keyboard input
 */
boolean ROTATE_LEFT;  //User is pressing <-
boolean ROTATE_RIGHT; //User is pressing ->
boolean MOVE_FORWARD; //User is pressing ^ arrow
boolean SPACE_BAR;    //User is pressing space bar


/* * * * * * * * * * * * * * * * * * * * * * *
 Initialize all of your variables and game state here
 */
public void setup() {
  size(1000, 800);

  starField = new Star[50];
  for(int i=0; i < starField.length; i++){
    starField[i] = new Star(random(0,1000), random(0, 800), (int)random(6,9));
  } 
  
  asteroids = new Asteroid[20];
  for(int i=0; i< asteroids.length; i++) {
    if(i % 3 == 0)
      asteroids[i] = new Asteroid(random(0, 1000), random(0,800), 2, random(0, 360), 2.0);
    if(i % 2 == 0)
      asteroids[i] = new Asteroid(random(0, 1000), random(0,800), 2, random(0, 360), 1.5);
    else
      asteroids[i] = new Asteroid(random(0, 1000), random(0,800), 2, random(0, 360), 1.0);
  } 
}


/* * * * * * * * * * * * * * * * * * * * * * *
 Drawing work here
 */
public void draw() {
  //your code here
  background(0);

  //Draw Starfield first 
  for(int i=0; i<starField.length; i++){
    starField[i].show();
  }
  
  for(int i=0; i<asteroids.length; i++){
    for(int j=0; j<asteroids.length; j++){
      if(asteroids[i].collidingWith(asteroids[j]) && i != j && asteroids[i].getAlive() && asteroids[j].getAlive()){
        asteroids[i].setDirection(asteroids[i].getDirection() + 90);
        asteroids[i].setX(asteroids[i].getX() + 5);
        asteroids[i].setY(asteroids[i].getY() + 5);
        
        asteroids[j].setDirection(asteroids[j].getDirection() + 90);
        asteroids[j].setX(asteroids[j].getX() - 5);
        asteroids[j].setY(asteroids[j].getY() - 5);
      }
      
    }
  }

  
  for(int i=0; i<asteroids.length; i++){
    //asteroids[i].checkCollision(asteroids[i], player1);
    asteroids[i].update();
    asteroids[i].show();
  }

  //Update spaceship
  if (ROTATE_LEFT)
    player1.setDirection(player1.getDirection() - 5.0);
  if (ROTATE_RIGHT)
    player1.setDirection(player1.getDirection() + 5.0);
  if (MOVE_FORWARD) {
    if (player1.getSpeed() < 2) {
      player1.setSpeed(player1.getSpeed() + 3);
    }
  } else {
    if (player1.getSpeed() > 0) {
      player1.setSpeed(player1.getSpeed() - 0.1);
    }
    if (player1.getSpeed() < 0) {
      player1.setSpeed(0);
    }
  }
  
  if(SPACE_BAR){
    player1.fire();
  }
  
  player1.checkCollisions(asteroids, player1);
  player1.show();
  player1.update();

  for(int i=0; i<asteroids.length; i++){
    player1.hasHitTarget(asteroids[i]);
  }

  //Check for ship collision agaist asteroids
  //TODO: Part II or III

  //Draw spaceship & and its bullets
  //TODO: Part IV - we will use a new feature in Java called an ArrayList, 
  //so for now we'll just leave this comment and come back to it in a bit. 

  //Update score
  //TODO: Keep track of a score and output the score at the top right
}



/* * * * * * * * * * * * * * * * * * * * * * *
 Record relevent key presses for our game
 */
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      ROTATE_LEFT = true;
    } else if ( keyCode == RIGHT ) {
      ROTATE_RIGHT = true;
    } else if (keyCode == UP) {
      MOVE_FORWARD = true;
    }  
  }

  //32 is spacebar
  if (keyCode == 32) {  
    SPACE_BAR = true;
  }
  
  if(keyCode == 72) {
    player1.hyperspace();
  }
}



/* * * * * * * * * * * * * * * * * * * * * * *
 Record relevant key releases for our game.
 */
void keyReleased() {  
  if (key == CODED) { 
    if (keyCode == LEFT) {
      ROTATE_LEFT = false;
    } else if ( keyCode == RIGHT ) {
      ROTATE_RIGHT = false;
    } else if (keyCode == UP) {
      MOVE_FORWARD = false;
    }
  }
  if (keyCode == 32) {
    SPACE_BAR = false;
  }
}
