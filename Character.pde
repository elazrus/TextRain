public class Character {
  private char c;
  private color col;
  private int sz;

  private float xPos;
  private float curYPos;
  private float ySpeed;

  private int threshold;
  private boolean falling;

  public Character(char c, color col, int sz, int threshold) {
    setC(c);
    setCol(col);
    setSz(sz);

    setXPos(0);
    setCurYPos(0-(textAscent() + textDescent()));
    setYSpeed(0);

    setThreshold(threshold);
    setFalling(false);
  }
  
  public void start() {
    setFalling(true);
  }
  
  public void stop() {
    setFalling(false);
  }

  public Character(char c, color col, int sz, float xPos, float ySpeed, int threshold) {
    setC(c);
    setCol(col);
    setSz(sz);

    setXPos(xPos);
    setCurYPos(textAscent() + textDescent());
    setYSpeed(ySpeed);

    setThreshold(threshold);
    setFalling(true);
  }

  public void update() {
    if (getCurYPos() < 0 || ceil(getCurYPos() + 1) >= height || isLocationBright((int)getXPos(), (int)getCurYPos() + 1)) {
      setFalling(true);
    }
    else {
      setFalling(false);
    }
    
    if (isFalling()) {
      textSize(getSz());

      float newYPos = getCurYPos() + getYSpeed();
      setCurYPos(newYPos);

      if ((newYPos - textAscent())> height) {
        setCurYPos(0-(textAscent() + textDescent()));
      }
    }
    else {
      setCurYPos(findFirstBrightSpot((int)getXPos(), (int)getCurYPos()));
    }
  }

  public void render() {
    fill(getCol());
    textSize(getSz());
    textAlign(CENTER, BOTTOM);
    text(getC(), getXPos(), getCurYPos());
  }
  
  public boolean isLocationBright(int x, int y) {
    int testValue = get(x, y);
    float testBrightness = brightness(testValue);
    return (testBrightness > getThreshold());
  }
  
  public int findFirstBrightSpot(int x, int y) {
    int yPos;
    for (yPos = y; yPos > 0; yPos--) {
      if (isLocationBright(x, yPos)) break;
    }
    return yPos;
  }

  public char getC() {
    return this.c;
  }

  public void setC(char c) {
    this.c = c;
  }

  public color getCol() {
    return this.col;
  }

  public void setCol(color col) {
    this.col = col;
  }

  public int getSz() {
    return this.sz;
  }

  public void setSz(int sz) {
    this.sz = sz;
  }

  public float getXPos() {
    return xPos;
  }

  public void setXPos(float xPos) {
    this.xPos = xPos;
  }

  public float getCurYPos() {
    return this.curYPos;
  }

  public void setCurYPos(float curYPos) {
    this.curYPos = curYPos;
  }

  public float getYSpeed() {
    return this.ySpeed;
  }

  public void setYSpeed(float ySpeed) {
    this.ySpeed = ySpeed;
  }

  public int getThreshold() {
    return this.threshold;
  }
  
  public void setThreshold(int threshold) {
    this.threshold = threshold;
  }

  public boolean isFalling() {
    return this.falling;
  }

  public void setFalling(boolean falling) {
    this.falling = falling;
  }
}

