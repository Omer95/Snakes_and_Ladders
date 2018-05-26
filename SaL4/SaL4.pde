/*
* @author Omer Farooq Ahmed and Tahaa Furqan. This program is a snakes and ladders game for ITP by Abdul Wajed
*/

//PROPERTIES

//x and y positions on the 100 cells of the grid
int [][] pos ={ {50, 950}, {150, 950}, {250, 950}, {350, 950}, {450, 950}, {550, 950}, {650, 950}, {750, 950}, {850, 950}, {950, 950},
              {50,850}, {150,850}, {250,850}, {350,850}, {450,850}, {550,850}, {650,850}, {750,850}, {850,850}, {950,850}, {50,750},
              {150,750}, {250,750}, {350,750}, {450,750}, {550,750}, {650,750}, {750,750}, {850,750}, {950,750}, {50,650}, {150,650},
              {250,650}, {350,650}, {450,650}, {550,650}, {650,650}, {750,650}, {850,650}, {950,650}, {50,550}, {150,550}, {250,550},
              {350,550}, {450,550}, {550,550}, {650,550}, {750,550}, {850,550}, {950,550}, {50,450}, {150,450}, {250,450}, {350,450},
              {450,450}, {550,450}, {650,450}, {750,450}, {850,450}, {950,450}, {50,350}, {150,350}, {250,350}, {350,350}, {450,350},
              {550,350}, {650,350}, {750,350}, {850,350}, {950,350}, {50,250}, {150,250}, {250,250}, {350,250}, {450,250}, {550,250},
              {650,250}, {750,250}, {850,250}, {950,250}, {50,150}, {150,150}, {250,150}, {350,150}, {450,150}, {550,150}, {650,150},
              {750,150}, {850,150}, {950,150}, {50,50}, {150,50}, {250,50}, {350,50}, {450,50}, {550,50}, {650,50}, {750,50}, {850,50}, {950,50}};
           
           
PImage image;
player[] playerList= new player[4];
int dice, playerNum;
boolean run;
boolean extra;

//Music object
import ddf.minim.*;
Minim minim;
AudioPlayer theme, right, wrong, fail;

void setup() {
 size(1000,1000); 
 //noStroke();
 stroke(#080202);
 frameRate(5);
 image=loadImage("SaL2.jpg");
 image(image,0,0,width,height);
 dice=1;
 playerNum=0;
 run=true;
 extra=false;
 
 //Music initialization
 minim= new Minim(this);
 theme= minim.loadFile("background.mp3");
 //theme.play();
 right= minim.loadFile("right.mp3");
 wrong= minim.loadFile("wrong.mp3");
 fail= minim.loadFile("fail.mp3");
 
 //initializing each player
 playerList[0]= new player(pos[0][0],pos[0][1],1, 'R');
 playerList[1]= new player(pos[0][0],pos[0][1],1, 'G');
 playerList[2]= new player(pos[0][0],pos[0][1],1, 'B');
 playerList[3]= new player(pos[0][0],pos[0][1],1, 'Y');
 
 //placing all players on the first square
 fill(255,0,0);
 rect(playerList[0].currentPosX, playerList[0].currentPosY,20,20);
 rect(playerList[1].currentPosX, playerList[1].currentPosY,20,20);
 rect(playerList[2].currentPosX, playerList[2].currentPosY,20,20); 
 rect(playerList[3].currentPosX, playerList[3].currentPosY,20,20); 
 
}

void draw() {
  dice=(int)random(1,7);
  
  if (dice==6) {
     playerList[playerNum].start=true; 
     extra=true; 
  }
  
  println(playerList[playerNum].name+": "+dice);
  
  
  if (playerList[playerNum].start==true && run==true) {
    
    if (playerList[playerNum].currentSquare+dice<=100) {
      
      playerList[playerNum].currentSquare+=dice;
      
      //this part deals with changing currentSquare according to snakes and ladders
      if (playerList[playerNum].currentSquare==8) {
         playerList[playerNum].currentSquare=59; 
         right=minim.loadFile("right.mp3");
         right.play();
      }
      if (playerList[playerNum].currentSquare==45) {
         playerList[playerNum].currentSquare=91; 
         right=minim.loadFile("right.mp3");
         right.play();
      }
      if (playerList[playerNum].currentSquare==40) {
         playerList[playerNum].currentSquare=5; 
         wrong=minim.loadFile("wrong.mp3");
         wrong.play();
      }
      if (playerList[playerNum].currentSquare==99) {
         playerList[playerNum].currentSquare=25; 
         wrong=minim.loadFile("wrong.mp3");
         wrong.play();
      }
      if (playerList[playerNum].currentSquare==94) {
         playerList[playerNum].currentSquare=62; 
         wrong=minim.loadFile("wrong.mp3");
         wrong.play();
      }
      if (playerList[playerNum].currentSquare==37) {
         playerList[playerNum].currentSquare=96; 
         right=minim.loadFile("right.mp3");
         right.play();
      }
      
      
      //this part deals with the current player beating another player and sending it back to start position
      if (playerList[playerNum].currentSquare==playerList[0].currentSquare && playerNum!=0 && playerList[playerNum].currentSquare!=100) {
         playerList[0].currentSquare=1;
         playerList[0].start=false; 
         println("player "+playerList[playerNum].name+" beat R");
         fail=minim.loadFile("fail.mp3");
         fail.play();
      }
      if (playerList[playerNum].currentSquare==playerList[1].currentSquare && playerNum!=1  && playerList[playerNum].currentSquare!=100) {
         playerList[1].currentSquare=1;
         playerList[1].start=false;
         println("player "+playerList[playerNum].name+" beat G"); 
         fail=minim.loadFile("fail.mp3");
         fail.play();
      }
      if (playerList[playerNum].currentSquare==playerList[2].currentSquare && playerNum!=2  && playerList[playerNum].currentSquare!=100) {
         playerList[2].currentSquare=1;
         playerList[2].start=false; 
         println("player "+playerList[playerNum].name+" beat B");
         fail=minim.loadFile("fail.mp3");
         fail.play();
      }
      if (playerList[playerNum].currentSquare==playerList[3].currentSquare && playerNum!=3  && playerList[playerNum].currentSquare!=100) {
         playerList[3].currentSquare=1;
         playerList[3].start=false; 
         println("player "+playerList[playerNum].name+" beat Y");
         fail=minim.loadFile("fail.mp3");
         fail.play();
      }
      
      //fills the old position with background color to erase player
      fill(#41bcf5);
      rect(playerList[playerNum].oldPosX, playerList[playerNum].oldPosY, 20,20);
      
      //sets the color according to the player
      if (playerNum==0) {
         fill(255,0,0);
      }
      if (playerNum==1) {
         fill(#38B428); 
      }
      if (playerNum==2) {
         fill(#091448); 
      }
      if (playerNum==3) {
         fill(#FFF534); 
      }
      //fills the players current square with the players rect
      rect(pos[playerList[playerNum].currentSquare-1][0], pos[playerList[playerNum].currentSquare-1][1], 20, 20); 
      
      //sets the updated old position for this player
      playerList[playerNum].oldPosX=pos[playerList[playerNum].currentSquare-1][0];
      playerList[playerNum].oldPosY=pos[playerList[playerNum].currentSquare-1][1];
    }
  }
  
  //This part solves the problem of blotting of the image by repainting image and all players in each iteration
  image(image, 0,0,width, height);
  fill(255,0,0);
  rect(pos[playerList[0].currentSquare-1][0], pos[playerList[0].currentSquare-1][1], 20, 20); 
  fill(#38B428); 
  rect(pos[playerList[1].currentSquare-1][0], pos[playerList[1].currentSquare-1][1], 20, 20); 
  fill(#091448);
  rect(pos[playerList[2].currentSquare-1][0], pos[playerList[2].currentSquare-1][1], 20, 20); 
  fill(#FFF534);
  rect(pos[playerList[3].currentSquare-1][0], pos[playerList[3].currentSquare-1][1], 20, 20); 
  
  
    //stops iteration if a player wins 
  //  if (playerList[playerNum].currentSquare==100)
      // run=false;
    if (playerList[0].currentSquare==100 && playerList[1].currentSquare==100 && playerList[2].currentSquare==100 && playerList[3].currentSquare==100) 
       run=false;
    
    if (extra==false) {
      playerNum++;
    }
    if (playerNum>3)
       playerNum=0;
          
    extra=false;
}
