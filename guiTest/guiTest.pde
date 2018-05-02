// integer variables
int frames = 0;
int fade   = 0;
int state  = -1;

// arrays
String[] gestures = {
  "Peace.png", "A okay.png", "Ball.png","FingerGun.png",
  "HungerGames.png", "Spock.png","Point.png", "Spreading.png",
  "Surfing.png","Thumb.png", "Rock and roll.png"
};
PImage[] gestureImg = new PImage[gestures.length];

// string variables
String header1 = "";
String header2 = "";

// asset initialization
PFont openSans;
PImage goodSign;
PImage badSign;
PImage hand;

void setup() {
  fullScreen();

  // asset loading
  openSans = createFont("Open Sans", 64, true);
  goodSign = loadImage("good.png");
  badSign  = loadImage("bad.png");
  hand     = loadImage("hand.png");

  textFont(openSans, 48);
  textAlign(CENTER);
  imageMode(CENTER);
}

void draw() {

  // variables
  frames++;
  if (frames < 51) {fade += 5;}

  // canvas
  translate(width/2,height/2);
  background(92, 147, 237);

  // header
  fill(255, fade);
  textSize(64);
  text(header1, 0, -120);

  // sub-header
  fill(255, fade-50);
  textSize(48);
  text(header2, 0, -60);

  // image
  tint(255, fade);
  switch(state) {
    case 0:
      break;
    case 1:
      image(hand, 0, 140, 300, 300);
    case 2:
      image(hand, 0, 140, 300, 300);
      break;
    case 3:
      image(gestureImg[i], 0, 140, 300, 300);
      break;
    case 4:
      image(badSign, 0, 140, 300, 300);
      break;
    case 5:
      image()
    default:
      break;
  }
}

void stateHandler(int arg) {

  frames = 0;
  fade   = 0;

  switch(arg) {
    case 0:
      header1 = "Velkommen";
      header2 = "Betal med Kinetix™";
      break;
    case 1:
      header1 = "" + 123.45 + "Kr."; // PRIS
      header2 = "Verificér med armbånd";
      break;
    case 2:
      header2 = "Verificér med fagt";
      break;
    case 3:
      header1 = "Succes!";
      header2 = "Betaling verificeret";
      break;
    case 4:
      header1 = "Fejl!";
      header2 = "Tast PIN-kode";
      break;
    default:
      // ?
  }
}

void keyPressed() {
  if (keyCode == 37 && state >= 1) {stateHandler(--state);}
  if (keyCode == 39 && state <= 3) {stateHandler(++state);}
}
