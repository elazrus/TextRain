public class CameraBlackWhite extends Camera {
  private color BLACK = color(#000000);
  private color WHITE = color(#ffffff);

  public CameraBlackWhite(Text_Rain_2_0 applet, int threshold) {
    setVideo(new Capture(applet, width, height));
    setNumPixels(getVideo().width * getVideo().height);

    setThreshold(threshold);
  }

  public void update() {
    if (getVideo().available()) {
      getVideo().read();
      getVideo().loadPixels();

      loadPixels();

      float pixelBrightness;
      for (int i=0; i < getNumPixels(); i++) {
        int pixelX = i % width;
        int pixelY = i / width;

        pixelBrightness = brightness(getVideo().pixels[i]);
        pixelBrightness = pow(pixelBrightness, 3);
        pixelBrightness = map(pixelBrightness, 0, 16581375, 0, 255);

        if (pixelBrightness > getThreshold()) {
          pixels[(width-1-pixelX) + pixelY*getVideo().width] = WHITE;
        }
        else {
          pixels[(width-1-pixelX) + pixelY*getVideo().width] = BLACK;
        }
      }

      updatePixels();
    }
  }

  public void render() {
  }
}

