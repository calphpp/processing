color bgcolor = color (0,0,0);
color gridcolor = color (0,0,0);
color sweepercolor = color (102,250,81);
float s;
float rond;
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
  sector = 3;
  getDistance();
  //println(distance);
  delay(1000);
  stipje();
}

 void circle(){
   fill(color (102,250,81,60));
   ellipse(400, 320, 600, 600);
 }
 
void grid(){
  stroke(#FAF7F7);
  strokeWeight(2);
    line(width/2, height/2, width/2,height/23);            //verticlal grid
    line(width/2, height/2, 700,height/2 );          //horizontal grid
     for(int i = 20; i <300; i+=20){
     line((width/2)+5,i,(width/2)-5,i);
   }
   for(int i = 700; i >400; i-=20){
     line(i, (height/2)+5,i,(height/2)-5 );
}}
 
void stipje(){
  // 3.333 = 1in
  distance = 300-(distance*1.05);
  //distance = 40;   // 84in
  //distance = 280;  // 12in
  // distance = 300; // 6in
  println(str(distance));
  // ellipse(400, int(distance), 20, 20);
  ellipse(450, int(distance), 20, 20);
}

void getDistance() {
  String[] lines = loadStrings("http://192.168.0.197/?sector=" + str(sector) );
  delay(500);
  distance = float(lines[0]);
}
