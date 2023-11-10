// Tillman Tate | 24 oct 2023 | Buttons
Button[] buttons = new Button[23];
String dVal;
String prevOperator;
float result;


void setup() {
  size (400, 500);
  dVal = "0";
  prevOperator = "";
  result = 0;
  buttons[0] = new Button(80, 460, 160, 80, "0");
  buttons[1] = new Button(40, 380, 80, 80, "1");
  buttons[2] = new Button(120, 380, 80, 80, "2");
  buttons[3] = new Button(200, 380, 80, 80, "3");
  buttons[4] = new Button(40, 300, 80, 80, "4");
  buttons[5] = new Button(120, 300, 80, 80, "5");
  buttons[6] = new Button(200, 300, 80, 80, "6");
  buttons[7] = new Button(40, 220, 80, 80, "7");
  buttons[8] = new Button(120, 220, 80, 80, "8");
  buttons[9] = new Button(200, 220, 80, 80, "9");
  buttons[10] = new Button(40, 140, 80, 80, "C");
  buttons[11] = new Button(120, 140, 80, 80, "DEL");
  buttons[12] = new Button(200, 140, 80, 80, "±");
  buttons[13] = new Button(280, 220, 80, 80, "÷");
  buttons[14] = new Button(280, 300, 80, 80, "x");
  buttons[15] = new Button(280, 380, 80, 80, "-");
  buttons[16] = new Button(280, 460, 80, 80, "+");
  buttons[17] = new Button(360, 420, 80, 160, "=");
  buttons[18] = new Button(200, 460, 80, 80, ".");
  buttons[19] = new Button(280, 140, 80, 80, "%");
  buttons[20] = new Button(360, 140, 80, 80, "SIN");
  buttons[21] = new Button(360, 220, 80, 80, "COS");
  buttons[22] = new Button(360, 300, 80, 80, "TAN");
}

void draw() {
  background(0);
  updateDisplay();
  for (int i =0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover();
  }
}
//void keyPressed() {
//  println("key:" + key);
//  println("keycode:"  + keyCode);
//  if (key == 0 || keyCode == 96 || keyCode == 48) {
//    handleEvent ("0");
//  } else if (key == 1 || keyCode == 97 || keyCode == 49) {
//    handleEvent ("1");
//  }
//}

//void handleEvent(String keyVal) {
//  if (left && dVal.length()<12) {
//    if (dVal.equals("0")) {
//      dVal = keyVal;
//    } else {
//      dVal += keyVal;
//    }
//    l = float(dVal);
//  } else if (!left && dVal.length()<12) {
//    if (dVal.equals("0")) {
//      dVal = keyVal;
//    } else {
//      dVal += keyVal;
//    }
//    r = float(dVal);
//  }
//}

float prevNumber = 0; // Store the previous number
boolean multiply = false; // Flag to indicate multiplication

void mousePressed() {
  float currentNumber = 0; // Declare currentNumber outside of the if statement
  for (int i = 0; i < buttons.length; i++) {
    if (buttons[i].on) {
      String label = buttons[i].label;
      if (label.equals("C")) {
        dVal = "0";
        prevOperator = "";
        result = 0;
      } else if (label.equals("DEL")) {
        if (dVal.length() > 0) {
          dVal = dVal.substring(0, dVal.length() - 1);
        }
      } else if(label.equals(".")) {
        if (!dVal.contains(".")) {
          dVal += label;
        }
      } else if (label.equals("=")) {
        currentNumber = Float.parseFloat(dVal); // Move this line outside the if statement
        if (prevOperator.equals("x")) {
          result *= currentNumber; // Perform multiplication
        } else if (prevOperator.equals("÷")) {
          if (currentNumber != 0) {
            result /= currentNumber; // Perform division (avoid division by zero)
          } else {
            // Handle division by zero error
            dVal = "Error";
            return;
          }
        } else {
          result = currentNumber;
        }
        dVal = String.valueOf(result);
        prevOperator = "";
      } else if (label.equals("x")) {
        prevOperator = "x";
        result = Float.parseFloat(dVal);
        dVal = "";
      } else if (label.equals("÷")) {
        prevOperator = "÷";
        result = Float.parseFloat(dVal);
        dVal = "";
      } else if (label.equals("±")) {
        // Toggle the sign of the number (positive/negative)
        currentNumber = Float.parseFloat(dVal); // Move this line outside the if statement
        dVal = String.valueOf(-currentNumber);
      } else if (label.equals("%")) {
        // Calculate the percentage
        currentNumber = Float.parseFloat(dVal); // Move this line outside the if statement
        dVal = String.valueOf(currentNumber / 100);
      } else if (label.equals("SIN")) {
    currentNumber = Float.parseFloat(dVal);
    dVal = "SIN(" + currentNumber + ")";
} else if (label.equals("COS")) {
    currentNumber = Float.parseFloat(dVal);
    dVal = String.valueOf(Math.cos(currentNumber));
} else if (label.equals("TAN")) {
    currentNumber = Float.parseFloat(dVal);
    dVal = String.valueOf(Math.tan(currentNumber));
}
 else {
        dVal += label;
      }
    }
  }
}





void updateDisplay() {
  fill(0);
  rectMode(CENTER);
  rect(width/2, 50, 380, 80, 7);
  fill(255);
  textSize(70);
  textAlign(RIGHT);
  dVal = dVal.replaceFirst("^0+(?!$)", "");
  if (dVal.endsWith(".0")) {
    dVal = dVal.substring(0, dVal.length() - 2);
  }
  text(dVal, width-20, 80);
}

//void performCalc() {
//  if(op.equals("=")) {
//  result = l + r;
//  } else if (op.equals("-")) {
//    result = l - r;
//  } else (op.equals("+")) {
//    result = l + r;
//  }
//}
