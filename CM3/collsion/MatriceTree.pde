class MetricTree
{
  int id = -1;
  MetricTree mtInside = null;
  MetricTree mtOutside = null;
  float mtRadius;
  ArrayList<PVector> particles;

  void insert (int newId, ArrayList<PVector> _particles, float mtR) {
    if (this.id == -1) {
      this.id = newId;
      this.mtRadius = mtR;
      this.particles = _particles;
      return;
    }
    PVector newPos = this.particles.get(newId);
    PVector myPos = this.particles.get(this.id);
    float d = dist(newPos.x, newPos.y, myPos.x, myPos.y);
    if (d < this.mtRadius) {
      if ( this.mtInside == null)
        this.mtInside = new MetricTree();
      this.mtInside.insert(newId, _particles, this.mtRadius / 2);
    } else {
      if (this.mtOutside == null)
        this.mtOutside = new MetricTree();
      this.mtOutside.insert(newId, _particles, this.mtRadius);
    }
  }

  void search(PVector pos, IntList neighbours, float rInteraction) {
    if (this.id == -1) return;
    PVector myPos = this.particles.get(this.id);
    float d = dist(myPos.x, myPos.y, pos.x, pos.y);
    if ( d < rInteraction) neighbours.append(this.id);
    if ( d < this.mtRadius) {
      if (this.mtInside != null)
        this.mtInside.search(pos, neighbours, rInteraction);
      if (this.mtOutside != null && (d + rInteraction > this.mtRadius))
        this.mtOutside.search(pos, neighbours, rInteraction);
    } else {
        //background(200); * méchant romain :(
      if (this.mtOutside != null)
        this.mtOutside.search(pos, neighbours, rInteraction);
      if((this.mtInside != null) && (d < this.mtRadius + rInteraction))
        this.mtInside.search(pos, neighbours, rInteraction);
    }
  }
}
