class Blocks {
  String blockName;
  
  Blocks(String name) {
   blockName = name;
  }
  
  void display() {
   if (blockName == "test") {
     background(255);
   } else if (blockName == "up") {
     background(125);
   } else if (blockName == "down") {
     background(125, 0, 0);
   } else if (blockName == "left") {
     background(0, 125, 0);
   } else if (blockName == "right") {
     background(0, 0, 125);
   }
  }
}
