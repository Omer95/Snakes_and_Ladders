 //This is class for the player object. Each of the four instances have the following properties and constructor
 class player {
 //PROPERTIES
 boolean start;
 int currentPosX, currentPosY;
 int oldPosX, oldPosY;
 int currentSquare;
 char name;
 
 public player(int currentPosX, int currentPosY, int currentSquare, char name) {
    this.currentPosX=currentPosX;
    this.currentPosY=currentPosY;
    this.currentSquare=currentSquare;
    oldPosX=currentPosX;
    oldPosY=currentPosY;
    start=false; 
    this.name=name;
 }
 
  
}
