final int N = 400;
final float damping = 0.999;
final float attract = 0.01;

final int Height = 400;
final int Width = 400;


float hauteur[] = new float[N];
float nextH[] = new float[N];
float vel[] = new float[N];

void settings()
{
  size(Height, Width);
}


void setup()
{
  for(int i = 0; i < N; i++)
  {
    hauteur[i] = 0;
    vel[i] = 0;
  }
  
  vel[(int)random(N)] = 100;
}

void draw()
{
  background(200);
  stroke(0);
  
  for(int i = 0; i < N - 1; i++) line(i, height/2.0 - hauteur[i], i + 1, height/2.0 - hauteur[i + 1]);
  for(int i = 1; i < N - 1; i++)
  {
    vel[i] += (hauteur[i - 1] + hauteur[i + 1]) / 2.0 - hauteur[i];
    vel[i] *= damping;
    vel[i] -= hauteur[i] * attract;
  }
  vel[0] += hauteur[1] - hauteur[0];
  vel[N - 1] += hauteur[N - 2] - hauteur[N - 1];

  for(int i = 0; i < N; i++) hauteur[i] += vel[i];
  for(int i = 1; i < N - 1; i++) nextH[i] = ((hauteur[i - 1] + hauteur[i + 1]) / 2.0 + hauteur[i]) / 2.0;
  for(int i = 1; i < N - 1; i++) hauteur[i] = nextH[i];
}
