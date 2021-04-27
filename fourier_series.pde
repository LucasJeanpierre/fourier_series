ArrayList<Wave> waves;
PVector loc;
PVector origin;
float length=200;
float time;

void setup() {
  size(1000, 800);
  background(0);
  waves = new ArrayList<Wave>();
  loc = new PVector(50, 50);
  origin = new PVector(width/2-200, height/2);
}

void draw() {
  background(0);
  time+=0.05;

  vague();
  cercles();
}


void vague() {
  waves.add(new Wave(width/2+200, loc.y));


  for (int i=0; i<waves.size(); i++) {
    Wave w =waves.get(i);
    if (i>1) {
      Wave w1 = waves.get(i-1);
      line(w.x, w.y, w1.x, w1.y);
    }
    w.update();
    w.show();
    if (w.x > width) {
      waves.remove(i);
    }
  }
}

void cercles() {
  for (int j = 0; j < 5; j++) {
    float n = 2 * j + 1;
    length=200/n;
    loc.x = origin.x+length*cos(time*n);
    loc.y = origin.y+length*sin(time*n);
    stroke(255);
    line(origin.x, origin.y, loc.x, loc.y);
    ellipse(loc.x, loc.y, 5, 5);
    origin.x=loc.x;
    origin.y=loc.y;
  }
  line(loc.x, loc.y, width/2+200, loc.y);
  origin.x=width/2-200;
  origin.y=height/2;
  length=200;
}


class Wave {
  float x;
  float y;
  float speed=2;

  Wave(float x_, float y_) {
    x=x_;
    y=y_;
  }

  void show() {
    stroke(255);
    strokeWeight(1);
    point(x, y);
  }

  void update() {
    x+=speed;
  }
}
