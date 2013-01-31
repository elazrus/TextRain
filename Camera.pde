public abstract class Camera {
  private Capture video;
  private int numPixels;
  
  private int threshold;
  
  public void startVideo() {
    getVideo().start();
  }
  
  public abstract void update();
  
  public abstract void render();
  
  public Capture getVideo() {
    return this.video;
  }
  
  public void setVideo(Capture video) {
    this.video = video;
  }
  
  public int getNumPixels() {
    return this.numPixels;
  }
  
  public void setNumPixels(int numPixels) {
    this.numPixels = numPixels;
  }
  
  public int getThreshold() {
    return this.threshold;
  }
  
  public void setThreshold(int threshold) {
    this.threshold = threshold;
  }
}
