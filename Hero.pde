class Hero {
 //Position
 int x = width/2;
 int y = height/2;
 int speed = 5;
 
 //Displays character
 void display() {
  rect(x, y, 25, 25); 
 }
 
 //Movement
 void moveRight() {
   x += speed;
 }
 
 void moveLeft() {
   x -= speed;
 }
 
 void moveUp() {
   y -= speed;
 }
 
 void moveDown() {
   y += speed;
 }
}