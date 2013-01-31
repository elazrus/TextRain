import processing.video.*;

Capture camera;
CameraBlackWhite bwCamera; 
CameraGrayscale gsCamera;

color bgColor;

String text;
Character[] characterSet1;
Character[] characterSet2;
Character[] characterSet3;

public void setup() {
  size(640, 480, P2D);
  smooth();

  int threshold = 50;

  //bwCamera = new CameraBlackWhite(this, threshold);
  //bwCamera.startVideo();
  gsCamera = new CameraGrayscale(this, threshold);
  gsCamera.startVideo();

  bgColor = color(#ffffff);

  text = "We are synonyms for limbs' loosening of syntax, and yet turn to nothing: It's just talk.";
  characterSet1 = new Character[text.length()];
  characterSet2 = new Character[text.length()];
  characterSet3 = new Character[text.length()];
  for (int i=0; i < text.length(); i++) {
    char c = text.charAt(i);
    color col = color(random(255), random(255), random(255));
    float speed = random(1, 6);
    characterSet1[i] = new Character(c, col, 14, 5 + i*7.25, speed, threshold);
    characterSet2[i] = new Character(c, col, 14, 5 + i*7.25, speed, threshold);
    characterSet3[i] = new Character(c, col, 14, 5 + i*7.25, speed, threshold);

    characterSet1[i].start();
  }
}

public void draw() {
  background(bgColor);
  update();
  render();
}

public void update() {
  //bwCamera.update();
  gsCamera.update();

  for (int i=0; i < text.length(); i++) {
    characterSet1[i].update();

    if (characterSet1[i].getCurYPos() > height/2) {
      characterSet2[i].start();
    }
    else if (characterSet2[i].getCurYPos() - textAscent() >= height || characterSet2[i].getCurYPos() < 0) {
      characterSet2[i].setCurYPos(0-(textAscent() + textDescent()));
      characterSet2[i].stop();
    }

    /*if (characterSet2[i].getCurYPos() > height/2) {
      characterSet3[i].start();
    }
    else if (characterSet3[i].getCurYPos() - textAscent() > height || characterSet3[i].getCurYPos() < 0) {
      characterSet3[i].setCurYPos(0-(textAscent() + textDescent()));
      characterSet3[i].stop();
    }*/

    characterSet2[i].update();
    //characterSet3[i].update();
  }
}

public void render() {
  for (int i=0; i < text.length(); i++) {
    characterSet1[i].render();
    characterSet2[i].render();
    characterSet3[i].render();
  }
}

