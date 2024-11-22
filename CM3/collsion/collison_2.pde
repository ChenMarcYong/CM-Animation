/*final int N = 1000;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup()
{
  size(500, 500);
  for(int i = 0; i < N; i++)
  {
    points.add(new PVector(random(width), random(height)));
  }
}

void draw()
{
  background(200);
  noFill();
  stroke(10);
  circle(mouseX, mouseY, 100);
  fill(10);
  for(int i = 0; i < N; i++)
  {
    PVector p = points.get(i);
    circle(p.x, p.y, 2);
  }
  for(int i = 0; i < N; i++)
  {
    PVector p = points.get(i);
    if(dist(p.x, p.y, mouseX, mouseY) < 50){
      fill(255, 10, 10);
    }
    else {fill(10);}
    circle(p.x, p.y, 5);
  }
  
}*/
