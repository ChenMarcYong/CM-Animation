class Particle {
  float x, y;
  float vx, vy;
  float radius = random(10, 15);
  float age = 0;
  
  
  Particle() {
    this.x = mouseX;
    this.y = mouseY;
    this.vx = random(3, 8);
    this.vy = random(-10, -5);
  }
  
  boolean finished(){
    return (this.age > 150);
  }
  
  void update() {
    this.vy += 0.25;
    this.x += this.vx;
    this.y += this.vy;
    this.age ++;
    
    if ((this.x < 0) || (this.x > width)) {
      this.vx *= -0.9;
      if(this.x < 0) this.x = 0;
      if(this.x > width) this.x = width;
    }
    if (this.y > height) {
      this.vy *= -0.9;
      this.y = height;
    }
  }
  
  void show()  {
    noStroke();
    fill(50);
    circle(this.x, this.y, radius);
  }
}
  
