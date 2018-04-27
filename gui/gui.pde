import processing.sound.*;

PImage sign;
PImage hand;
SoundFile ok;
SoundFile no;
int fade = 0;
int shift;
int shift2;

void setup() {
  frameRate(60);
  fullScreen();
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  sign = loadImage("signify.png");
  hand = loadImage("hand.png");
  ok = new SoundFile(this, "ok.wav");
  no = new SoundFile(this, "no.wav");
  shift = width*10;
  shift2 = 0;
}

void draw() {
  background(92, 147, 237);
  translate(width/2, height/2);
  noStroke();
  image(sign, shift, 0, width/2, width/4);
  fill(92, 147, 237);
  rect(width/3.5, 5, width/4, width/4);
  rect(-width/3.5, 5, width/4, width/4);
  fill(50, 50, 50, fade);
  if (frameCount < 128) {fade += 5;}
  textSize(64);
  text("Betal med Kinetix™", 0, -height/2*0.75);
  tint(255, fade);
  image(hand, shift2, cos(frameCount)*10);
}

void keyPressed() {
  if (keyCode == 37) {
    shift =  -200;
    shift2 = width*10;
    no.play();
  } else if (keyCode == 39) {
    shift = 200;
    shift2 = width*10;
    ok.play();
  } else {
    shift = width*10;
    shift2 = 0;
  }
}
