

String[] gestikimg = { "Peace.png", "A okay.png", "Ball.png","FingerGun.png","HungerGames.png", "Spock.png","Point.png", "Spreading.png", "Surfing.png","Thumb.png", "Rock and roll.png" };
PImage[] gestikbillede = new PImage[gestikimg.length];
void setup() {

}

void draw() {
  
for (int i=0; i < gestikimg.length; i++){
    String gestikimg = gestikimg[i];
    gestikbillede[i] = loadImage(gestikimg);
  }
  delay(500);
}