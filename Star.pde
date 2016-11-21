class Star {
  float x;
  float y;  
  float radius;
  float speed;
  boolean canCollide;
  
  // The constructor
  Star(float x, float y, float radius, float speed){
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.speed = speed;
    this.canCollide = true;
  }
  
  void move(){
    this.x -= speed;
    if (Math.abs(this.x-width/2) <= 15 && this.canCollide){
      if (this.y < height/2) checkCollision(animals[0]);
      else checkCollision(animals[1]);  
    }
  }
  
  void checkCollision(Animal animal){
    if (Math.abs(animal.y - this.y) <= animal.radius/2){
      animal.collision();  
      this.canCollide = false;
    }
  }
  
  // Displays the star
  void display(){
    noStroke();
    noStroke();
    fill(255,255,255);
    ellipse(x, y, radius, radius);
  }
}