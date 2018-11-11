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
  
  for(sector = 0; sector <5; sector++){
    grid(); 
    circle();
    getDistance();
    println("Sector "+ str(sector) + ": Range = " + distance + "cm");
    //delay(1000);
    plot();
  }
 
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
  float distanceMapped_X;
  float distanceMapped_Y;
  
  if (sector == 0) { 
    distanceMapped = map(distance, 0, 200, width/2, 700);
    println(distanceMapped);
    ellipse(int(distanceMapped), height/2, 20, 20); 
  }
  if (sector == 1) {
    distanceMapped = map(distance, 0, 200, 0, 300);  // c (Hyp) 200cm  = 300 pixels
    distanceMapped_X = map((distance*cos(45)), 0, 157, width/2, (width/2)+157); //a
    distanceMapped_Y = map((distance*sin(45)), 0, 255, height/2, (height/2)-255);  //a
    ellipse(int(distanceMapped_X), int(distanceMapped_Y), 20, 20); 
  }
  if (sector == 2) {
    distanceMapped = map(distance, 0, 200, height/2, 10);
    ellipse(width/2, int(distanceMapped), 20, 20);
  }
  if (sector == 3) {
    distanceMapped = map(distance, 0, 200, 0, 300);  // c (Hyp) 200cm  = 300 pixels
    distanceMapped_X = map((distance*cos(45)), 0, 157, width/2, (width/2)-157); //a
    distanceMapped_Y = map((distance*sin(45)), 0, 255, height/2, (height/2)-255);  //a
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
