ArrayList<Particle> particules = new ArrayList<>();

void setup()
{
  size(600, 600);
}

void draw()
{
  background(200);
  smoke();
  
}




void mousePressed() {
  
}


void smoke()
{
 for(int i = 0; i < 2; i++)
  {
    particules.add(new Particle());
  }
  
  for(int i = 0; i < particules.size() - 1; i++)
  {
    particules.get(i).update();
    particules.get(i).show();
    if ( particules.get(i).finished() ) particules.remove(i);
  } 
}
