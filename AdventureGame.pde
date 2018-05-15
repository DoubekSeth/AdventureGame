//Hero Stuff
Hero hero;

//Inputs
boolean[] keys;

//Blocks
String currentBlock;
String moveBlock;
//Block Initialization
Blocks test;
Blocks up;
Blocks down;
Blocks left;
Blocks right;

void setup() {
  //Blocks
  currentBlock = "test";
  
  //Upkeep
  size(1280, 1024);
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
  changeBlock();
  drawBlock();
  
  //Stuff about the player
  hero.display();
  
  //Key Inputs
  keyPress();
}


//BLOCKS!
//Displays the blocks
void drawBlock() {
 if (currentBlock == "test") {
  test.display(); 
 } else if (currentBlock == "up") {
  up.display(); 
 } else if (currentBlock == "down") {
  down.display(); 
 } else if (currentBlock == "left") {
  left.display(); 
 } else if (currentBlock == "right") {
  right.display();  
 }
}

//Changes the blocks
void changeBlock() {
  //For "up"
  int changeY = height-25;
  //For "left"
  int changeX = width-25;
  
  //For the "test" block
  if(currentBlock == "test" && moveBlock == "up") {
    currentBlock = "up";
    moveBlock = "";
    hero.y = changeY;
  } else if(currentBlock == "test" && moveBlock == "down") {
    currentBlock = "down";
    moveBlock = "";
    hero.y = 25;
  } else if(currentBlock == "test" && moveBlock == "left") {
    currentBlock = "left";
    moveBlock = "";
    hero.x = changeX;
  } else if(currentBlock == "test" && moveBlock == "right") {
    currentBlock = "right";
    moveBlock = "";
    hero.x = 0;
  }
  
  //For the "up" block
  if(currentBlock == "up" && moveBlock == "down") {
    currentBlock = "test";
    moveBlock = "";
    hero.y = 0;
  }
  
  //For the "down" block
  if(currentBlock == "down" && moveBlock == "up") {
    currentBlock = "test";
    moveBlock = "";
    hero.y = changeY;
  }
  
  //For the "left" block
  if(currentBlock == "left" && moveBlock == "right") {
    currentBlock = "test";
    moveBlock = "";
    hero.x = 0;
  }
  
  //For the "right" block
  if(currentBlock == "right" && moveBlock == "left") {
    currentBlock = "test";
    moveBlock = "";
    hero.x = changeX;
  }
}

//Detects when the player hits the edge
void detectBlock() {
 if (hero.x < 0) {
  moveBlock = "left"; 
 } else if (hero.x >= width) {
  moveBlock = "right"; 
 } else if (hero.y < 0) {
  moveBlock = "up"; 
 } else if (hero.y >= height) {
  moveBlock = "down";
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