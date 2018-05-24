//Hero Stuff
Hero hero;

//Inputs
boolean[] keys;

//Blocks
int blockX;
int blockY;
//Block Initialization
Blocks test;
Blocks up;
Blocks down;
Blocks left;
Blocks right;

void setup() {
  //Blocks
  blockX = 0;
  blockY = 0;
  
  //Upkeep
  fullScreen();
  background(255, 255, 255);
  
  //Hero
  hero = new Hero();
  keys = new boolean[4];
  
  //Inputs
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
  
  //Initialize the blocks
  test = new Blocks("test");
  up = new Blocks("up");
  down = new Blocks("down");
  left = new Blocks("left");
  right = new Blocks("right");
}

void draw() {
  //All the stuff for block logic
  detectBlock();
  drawBlock();
  
  //Stuff about the player
  hero.display();
  
  //Key Inputs
  keyPress();
}


//BLOCKS!
//Displays the blocks
void drawBlock() {
 if (blockX == 0 && blockY == 0) {
  test.display(); 
 } else if (blockX == 0  && blockY == 1) {
  up.display(); 
 } else if (blockX == 0  && blockY == -1) {
  down.display(); 
 } else if (blockX == -1  && blockY == 0) {
  left.display(); 
 } else if (blockX == 1  && blockY == 0) {
  right.display();  
 }
}

//Detects when the player hits the edge
void detectBlock() {
 //For up
 int changeY = height-25;
 //For left
 int changeX = width-25;
  
 if (hero.x < 0) {
  blockX -= 1;
  hero.x = changeX;
 } else if (hero.x >= width) {
  blockX += 1;
  hero.x = 0;
 } else if (hero.y < 0) {
  blockY += 1;
  hero.y = changeY;
 } else if (hero.y >= height) {
  blockY -= 1;
  hero.y = 25;
 }
}


//KEYS!
//The thing doing the heavy lifting
void keyPress() {
 if (keys[0] == true) {
  hero.moveUp(); 
 }
 if (keys[1] == true) {
  hero.moveDown(); 
 }
 if (keys[2] == true) {
  hero.moveLeft(); 
 }
 if (keys[3] == true) {
  hero.moveRight(); 
 }
}

//When they type something
void keyPressed() {
  if (key == 'w') {
    keys[0] = true;
  }
  if (key == 's') {
    keys[1] = true;
  }
  if (key == 'a') {
    keys[2] = true;
  }
  if (key == 'd') {
    keys[3] = true;
  }
}

//When they release something
void keyReleased() {
  if (key == 'w') {
    keys[0] = false;
  }
  if (key == 's') {
    keys[1] = false;
  }
  if (key == 'a') {
    keys[2] = false;
  }
  if (key == 'd') {
    keys[3] = false;
  }
}
