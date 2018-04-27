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
SoundFile ok;
SoundFile no;
int fade = 0;
int shift;
int shift2;

public void setup() {
  frameRate(60);
  
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

public void draw() {
  background(92, 147, 237);
  translate(width/2, height/2);
  noStroke();
  image(sign, shift, 0, width/2, width/4);
  fill(92, 147, 237);
  rect(width/3.5f, 5, width/4, width/4);
  rect(-width/3.5f, 5, width/4, width/4);
  fill(50, 50, 50, fade);
  if (frameCount < 128) {fade += 5;}
  textSize(64);
  text("Betal med Kinetix™", 0, -height/2*0.75f);
  tint(255, fade);
  image(hand, shift2, cos(frameCount)*10);
}

public void keyPressed() {
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
