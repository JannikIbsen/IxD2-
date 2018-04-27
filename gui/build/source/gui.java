import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class gui extends PApplet {



PImage sign;
PImage hand;
PImage chevron;
SoundFile ok;
SoundFile no;
int fade = 0;
int stateIndex;

public void setup() {
  
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);
  sign = loadImage("signify.png");
  hand = loadImage("hand.png");
  chevron = loadImage("chevron.png");
  ok = new SoundFile(this, "ok.wav");
  no = new SoundFile(this, "no.wav");
}

public void draw() {
  translate(width/2, height/2);
  background(92, 147, 237);

  switch (stateIndex) {
    case 0:
      initState();
      break;
    case 1:
      buyState(123.45f);
      break;
    case 2:
      endState("ok");
      break;
    default:
      break;
  }
  /*
  noStroke();
  image(sign, shift, 0, 960, 480);
  fill(92, 147, 237);
  rect(550, 5, 480, 480);
  rect(-550, 5, 480, 480);
  fill(50, 50, 50, fade);
  if (frameCount < 128) {fade += 5;}
  textSize(64);
  text("Betal med Kinetix™", 0, -height/2*0.75);
  tint(255, fade);
  image(hand, shift2, cos(frameCount)*10);
  */
}

public void initState() {
  if (frameCount < 51) {fade += 5;}
  tint(255, fade);
  image(hand, 0, cos(frameCount)*15);
  fill(0, 0, 0, fade);
  textSize(64);
  text("Betal med Kinetix™", 0, -340);
}

public void buyState(float price) {
  textAlign(LEFT, CENTER);
  fill(255, 255, 255, 150);
  textSize(48);
  text("At betale: ", -300, -50);
  fill(255);
  textSize(36);
  text(price + "Kr.", -300, 0);
  tint(255);
  image(chevron, 0, 250, 300, 300);
}

public void endState(String arg) {
  fill(92, 147, 237);
  noStroke();
  if (arg == "ok") {
    image(sign, 173, 0, 600, 300);
    rect(360, 5, 360, 360);
  } else if (arg == "no") {
    image(sign, -173, 0, 600, 300);
    rect(-360, 5, 360, 360);
  } else {
    print("ERROR: desired state defined wrong");
  }
}

public void keyPressed() {
  switch (keyCode) {
    case 37:
      stateIndex--;
      break;
    case 39:
      stateIndex++;
      break;
    default:
      break;
  }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "gui" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
