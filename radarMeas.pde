color bgcolor = color (0,0,0);
color gridcolor = color (0,0,0);
float s;
float val;
float distance; 
int l;
int sector;

void setup() {
  size(800, 640);
}

void draw(){
  background(bgcolor);
  grid(); 
  circle();
  sector = 0;
  getDistance();
  println("Sector "+ str(sector) + ": Range = " + distance + "cm");
  //delay(1000);
  plot();
  
  grid(); 
  circle();
  sector = 2;
  getDistance();
  println("Sector "+ str(sector) + ": Range = " + distance + "cm");
  //delay(1000);
  plot();
  
  grid(); 
  circle();
  sector = 3;
  getDistance();
  println("Sector "+ str(sector) + ": Range = " + distance + "cm");
  //delay(1000);
  plot();
  
  grid(); 
  circle();
  sector = 4;
  getDistance();
  println("Sector "+ str(sector) + ": Range = " + distance + "cm");
  //delay(1000);
  plot();
}

 void circle(){
   fill(color (102,250,81,60));
   ellipse(width/2, height/2, 600, 600);
 }
 
void grid(){
  stroke(#FAF7F7);
  strokeWeight(2);
    line(width/2, height/2, width/2,height/23);  //verticlal grid
    line(100, height/2, 700,height/2 );          //horizontal grid
    for(int i = 20; i <320; i+=20){
     line((width/2)+5,i,(width/2)-5,i);
    }
    for(int i = 700; i >90; i-=20){
     line(i, (height/2)+5,i,(height/2)-5 );
}}
 
void plot(){
  float distanceMapped;
  if (sector == 0) { 
    distanceMapped = map(distance, 0, 200, width/2, 700);
    println(distanceMapped);
    ellipse(int(distanceMapped), height/2, 20, 20); 
  }
  if (sector == 2) {
    distanceMapped = map(distance, 0, 200, height/2, 10);
    ellipse(width/2, int(distanceMapped), 20, 20);
  }
  if (sector == 3) {
    distanceMapped = map(distance, 0, 200, 0, 300);  // c (Hyp) 200cm  = 300 pixels
    float distanceMapped_X = map((300*cos(45)), 0, 157, width/2, (width/2)-157); //a
    float distanceMapped_Y = map((300*sin(45)), 0, 255, height/2, (height/2)-255);  //a
    ellipse(int(distanceMapped_X), int(distanceMapped_Y), 20, 20); 
  }
  if (sector == 4) {
    distanceMapped = map(distance, 0, 200, width/2, 100);
    ellipse(int(distanceMapped), height/2, 20, 20); 
  }
}

void getDistance() {
  String[] lines = loadStrings("http://192.168.0.197/?sector=" + str(sector) );
  delay(500);
  distance = float(lines[0]);
}
