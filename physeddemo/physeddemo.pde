PFont font;
int fontSize = 20;

int jugglex=800;
int score = 0;
boolean movingLeft=false, movingRight=false;
 ArrayList<ball> balls = new ArrayList<ball>();
void setup(){
 size(1600,500); 
 background(0);
font = createFont("Arial Italic", fontSize, true);
textFont(font, fontSize);
 balls.add(new ball(250,5,250));
}

void draw(){
  background(0);
  for( int i=0; i < balls.size(); i++){
    fill(255);
    ellipse(balls.get(i).landingpoint,balls.get(i).currentposition, 25,25);
    if (balls.get(i).currentposition>475 && (balls.get(i).landingpoint>jugglex+50 || balls.get(i).landingpoint<jugglex-50)){
    die();
    }
    balls.get(i).move();
    if (balls.get(i).addscore==true){
     score+=1; 
     if (score%10==0){
       balls.add(new ball(random(25,1575),5,250));
     }
     balls.get(i).addscore=false;
    }
  }
  text(score,1500,50);
  rect(jugglex, 450,50,10);
  if( movingLeft==true) jugglex-=10;
  if( movingRight==true) jugglex+=10;
  
}


void keyPressed() {
  if (keyCode==LEFT) movingLeft=true;
  if (keyCode==RIGHT) movingRight=true;
}
void keyReleased() {
  if (keyCode==LEFT) movingLeft=false;
  if (keyCode==RIGHT) movingRight=false;
}
void die(){
 noLoop(); 
}
