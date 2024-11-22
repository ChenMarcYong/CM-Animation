final int N = 1000;

ArrayList<PVector> points = new ArrayList<PVector>();
MetricTree mt = new MetricTree();


int numballs;
  void setup()
{
  size(500, 500);
  for (int i = 0; i < N; i++)
  {
    points.add(new PVector(random(width), random(height)));
    mt.insert(i, points,  width * height);
  }
}

void draw()
{
  background(200);
  noFill();
  stroke(10);
  circle(mouseX, mouseY, 100);
  fill(10);
  for (int i = 0; i < N; i++)
  {
    PVector p = points.get(i);
    circle(p.x, p.y, 2);
  }
  IntList voisins = new IntList();
  mt.search(new PVector(mouseX, mouseY), voisins, 50);
  for (int i : voisins)
  {
    PVector p = points.get(i);
   
   fill(255, 10, 10);
    circle(p.x, p.y, 5);
  }
}
