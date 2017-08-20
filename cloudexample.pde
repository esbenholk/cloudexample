ArrayList poop = new ArrayList();
int bg=0;
Cloud c;
void setup() {
  size(600, 400);
  background(255,255,0);

  for (int i=0;i<100;i++) {
    Cloud c = new Cloud((int)random(width/2-50, width/2+50), (int)random(height/2-50, height/2+50), random(0, 2*PI)); 
    poop.add(c);
  }
  
}

void draw() {
 //background(0);

  for (int i=0;i<poop.size();i++) {
    Cloud c = (Cloud) poop.get(i);
    c.display();
    c.run();
  }
}


class Cloud {
  int x, y;
  PVector loc, center, increment;
  float t, esize, angle, SIZE, acc= 0.98;
  Cloud(int _x, int _y, float _angle) {
    x = _x;
    y = _y;
    loc = new PVector(x, y);
    center = new PVector(x, y);
    esize = random(0, 80);
    SIZE = random(150);
    angle = _angle;
    t = random(PI);
    int xp = (int)random(-5, 5);
    int yp = (int)random(-5, 5);
    increment = new PVector(xp, yp);
  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    noFill();
    stroke(0, 150);
    strokeWeight(0);
    arc(0, 0, esize, esize, t+QUARTER_PI, TWO_PI);
    noStroke();
    fill(0, 150);
    ellipse(0, 0, esize, esize);
    popMatrix();
    fill(0, 10);
    ellipse(x, y, 100, 100);
  }
  void run() {
    if (loc.dist(center)<random(150)-esize/2 && 100<loc.y && loc.y<height-100) {
      loc.add(increment);
      //loc.mult(1.08);
    }

    if (esize < SIZE )esize = esize+1;
  }
}