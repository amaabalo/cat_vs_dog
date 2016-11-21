class Animal{
  float y;
  float ySpeed;
  float radius;
  String player;
  float maxY, minY;
  float collisionTime;
  int numCollisions;
  PImage img;
  PImage lives;
  int score;
  SoundFile sound;
  
  Animal(String player, PApplet p){
    this.player = player;
    this.collisionTime = 0;
    this.numCollisions = 0;
    this.radius = 30;
    this.img = loadImage("square" + player + ".png");
    this.img.resize((int)(radius),(int)(radius));
    this.lives = loadImage("data/heart.png");
    this.lives.resize((int)(radius/2),(int)(radius/2));
    this.sound = new SoundFile(p, this.player + ".mp3");
    if (player == "Dog"){
      this.y = 0.75*height;
      this.maxY = height;
      this.minY = 0.5*height;
      this.sound.amp(0.3);
    }
    else {
      this.y = 0.25*height;
      this.maxY = 0.5*height;
      this.minY = 0;
    }
    this.ySpeed = 2.5;
    this.score = 0;
  }
  
  void display(){
    stroke(253,231,129);
    strokeWeight(1);
    if (millis() > this.collisionTime) noFill();
    else fill(255,0,0,100);
    ellipse(width/2, this.y, this.radius, this.radius);
    image(img,width/2-img.width/2,this.y-img.height/2);
    for (int i = 0; i < 10-this.numCollisions; i++){
        image(lives, 20, maxY - height/30 - (i)*height/20);
    }  
  }
  
  void collision(){
    this.collisionTime = millis()+300;
    this.numCollisions++;
    if (this.numCollisions == 10){
      endGame(this);
    }
    else this.sound.play();
  }
  
  void move(String direction){
    switch (direction){
      case "up":
        if (this.y > this.minY+this.radius/2) this.y -= ySpeed;
        break;
      case "down":
        if (this.y < this.maxY-this.radius/2) this.y += ySpeed;
        break;
      default:
        break;
    }
  }
}