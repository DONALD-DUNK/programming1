class Button {
  float x;
  float y;
  float w;
  float h;
  boolean on;
  String label;
  
  Button(float tempX, float tempY, float tempW, float tempH, String tempLabel) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    on = true;
    label = tempLabel;
  }
  
  void display() {
    if (on) {
      fill(255,159,10,255);
    } else {
      fill(101,101,99,255);
    }
    rectMode(CENTER);
    float cornerRadius = 0;
    rect(x, y, w, h, cornerRadius);
    
    fill(255);
    textSize(40);
    textAlign(CENTER, CENTER);
    text(label, x, y);
  }
  
  void hover() {
    if (mouseX > x - w / 2 && mouseX < x + w / 2 && mouseY > y - h / 2 && mouseY < y + h / 2) {
      on = true;
    } else {
      on = false;
    }
  }
}
