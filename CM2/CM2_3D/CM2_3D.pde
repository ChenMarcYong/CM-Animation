import peasy.*;


final int N = 50;
final float damping = 0.999;
final float attract = 0.01;



float h[][] = new float[N][N];
float nextH[][] = new float[N][N];
float vel[][] = new float[N][N];
 //<>//
PeasyCam cam;

void setup()
{
  size(800, 800, P3D);
  cam = new PeasyCam(this, 300);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  for(int i = 0; i < N; i++) 
    for(int j = 0; j < N; j++) {
      h[i][j] = 0;
      vel[i][j] = 0;
    }
    
  vel[(int)random(N)][(int)random(N)] = 100;
  
}

void draw()
{
  background(200);
  rotateX(-.5);
  lights();
  for(int i = 0; i < N - 1; i++) 
    for(int j = 0; j < N - 1; j++) {
      beginShape();
      vertex(map(i, 0, N - 1, -200, 200), h[i][j], map(j, 0, N - 1, -200, 200)); //<>//
      vertex(map(i, 0, N - 1, -200, 200), h[i][j + 1], map(j, 0, N - 1, -200, 200));
      vertex(map(i, 0, N - 1, -200, 200), h[i + 1][j + 1], map(j, 0, N - 1, -200, 200));
      vertex(map(i, 0, N - 1, -200, 200), h[i + 1][j], map(j, 0, N - 1, -200, 200));
      endShape();    
    }
 
  for(int i = 0; i < N - 1; i++) 
    for(int j = 0; j < N - 1; j++) {
      float left = (i < 0) ? h[i - 1][j] : h[i][j]; 
      float right = (i < N - 1) ? h[i + 1][j] : h[i][j]; 
      float up = (j < 0) ? h[i][j - 1] : h[i][j]; 
      float down = (j < N - 1) ? h[i][j + 1] : h[i][j]; 
      vel[i][j] += ((left + right + up + down) / 4.0) - h[i][j];
      vel[i][j] *= damping; 
      vel[i][j] -= h[i][j] * attract; 
    }
}
