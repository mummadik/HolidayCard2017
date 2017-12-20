int x=400;


void setup() {
  size(700, 600);
  smooth();
  noStroke();
}

void draw() {
  background(179, 0, 71);
  frameRate(4);
  snow();
  snowMan();
  stuff();
}

void snow() {
  // Snow
  fill(255, 255, 255);
  stroke(200, 200, 200);
  strokeWeight(2);
  for (int i = 0; i <20; i = i+1) {
    for (int j=0; j<20; j=j+1) {
      point(random(i*40, (i+1)*2), random(height));
    }
  }
}
void stuff() {
  noStroke();
  fill(0, 205, 50);
  triangle(50, 500, 350, 500, 200, 100);
  fill(255, 255, 255);     //background snow
  rect(0, (550-frameCount/5), width, (50+frameCount/5));

  fill(137, 100, 90);  //stump
  rect(175, 500, 50, 60);  

  fill(255, 255, 255);  //snow in front of stump
  rect(0, (560-frameCount/5), width, (frameCount/5)); 


  // Ornaments
  fill(random(200, 255), random(255), random(255));
  ellipse(random(100, 300), random(440, 460), 10, 10);

  fill(random(200, 255), random(255), random (255));
  ellipse(random(170, 300), random(420, 450), 10, 10);

  fill(random(0, 255), random(200, 255), random(255));
  ellipse(random(105, 295), random(415, 435), 10, 10);

  fill(random(0, 255), random(255), random(200, 255));
  ellipse(random(110, 290), random(390, 410), 10, 10);

  fill(random(200, 255), random(255), random(255));
  ellipse(random(115, 285), random(365, 385), 10, 10);

  fill(random(200, 255), random(200, 255), random(255));
  ellipse(random(150, 280), random(340, 360), 10, 10);
}


void snowMan () {
  //size(500, 500);
  ///Bottom
  noStroke();
  rect(-1, 500, 600, 100);
  ///Snowman
  ellipse (x, 450, 250, 250);
  ellipse (x, 300, 170, 170);
  ellipse (x, 180, 120, 120);
  ///Face
  fill(0);
  ellipse (380, 160, 10, 10);
  ellipse (420, 160, 10, 10);
  ellipse (430, 200, 10, 10);
  ellipse (415, 205, 10, 10);
  ellipse (x, 208, 10, 10);
  ellipse (385, 205, 10, 10);
  ellipse (370, 200, 10, 10);
  fill(255, 155, 0);
  triangle(300, 190, 300, 180, 320, 185);
  ///Body
  fill(0);
  ellipse (x, 250, 10, 10);
  ellipse (x, 300, 10, 10);
  ellipse (x, 350, 10, 10);
}
