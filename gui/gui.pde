import processing.sound.*;

PFont openSans;
PImage goodImg;
PImage badImg;
PImage hand;
PImage chevron;
SoundFile goodSound;
SoundFile badSound;
int fade = 0;
int stateIndex;
int frames = 0;

void setup() {
  fullScreen();
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);
  openSans = createFont("Open Sans", 64, true);
  textFont(openSans);
  goodImg = loadImage("ok.png");
  badImg = loadImage("no.png");
  hand = loadImage("hand.png");
  chevron = loadImage("chevron.png");
  goodSound = new SoundFile(this, "ok.wav");
  badSound = new SoundFile(this, "no.wav");
}

void draw() {
  translate(width/2, height/2);
  background(92, 147, 237);

  frames++;
  if (frames < 51) {fade += 5;}

  switch (stateIndex) {
    case 0:
      initState();
      break;
    case 1:
      buyState(123.45);
      break;
    case 2:
      endState(true);
      break;
    default:
      break;
  }
}

void initState() {
  tint(255, fade);
  image(hand, 0, cos(frames)*15);
  fill(255, fade);
  textAlign(CENTER);
  textSize(64);
  text("Betal med Kinetix™", 0, -340);
}

void buyState(float price) {
  textAlign(LEFT, CENTER);
  fill(255, fade-150);
  textSize(48);
  text("At betale: ", -300, -50);
  fill(255, fade);
  textSize(36);
  text(price + "Kr.", -300, 0);
  textAlign(CENTER);
  text("Verificér nu", 0, 150);
  tint(255, fade);
  image(chevron, 0, 275+cos(frames)*15, 300, 300);
}

void endState(boolean succ) {
  textAlign(CENTER);
  tint(255, fade);
  noStroke();
  if (succ) {
    text("Tak fordi du brugte Kinetix", 0, -100);
    image(goodImg, 0, 100, 250, 250);
  } else {
    text("Fejl - prøv igen", 0, -100);
    image(badImg, 0, 100, 250, 250);
  }
}

// for testing purposes
void keyPressed() {
  switch (keyCode) {
    case 37:
      stateIndex--;
      frames = 0;
      fade   = 0;
      break;
    case 39:
      stateIndex++;
      frames = 0;
      fade   = 0;
      break;
    default:
      break;
  }
}