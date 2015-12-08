PImage crestImage;
PImage fansImage;

PImage world;
boolean txt = false;

PFont f;
Blob[] blob = new Blob[6];
String[] name = {
"Europe :  ",
"Asia :  ",
"USA/Can :  ",
"S.America :  ",
"Africa :  ",
"Aus/New Z :  ",

};

 // amount of fans
int[] fanBase = {
4570000,
1600000,
787000,
240000,
120000,
1150000,
};



void setup()
{
  size(650,650);
  background(0,175,80);
  
  loadData();
  insertAverages();
  


  //loads the image onto the sketch

  crestImage = loadImage("celtic_logo.jpg");
  fansImage = loadImage("photobhoy.jpg");
}



ArrayList<ArrayList<Float>> data = new ArrayList<ArrayList<Float>>();

ArrayList<Float> sums = new ArrayList<Float>();



void insertAverages()
{
  for(ArrayList<Float> lineData:data)
  {
    float sum = 0;
    for (float f:lineData)
    {
      sum += f;
    }
    sums.add(sum);
  }
}


void drawTrendLineGraph(ArrayList<Float> data, String title)
{
  
 background(0);
  strokeWeight( 4 );
  
  float border = width * 0.1f;
  // Print the text 
   textAlign(CENTER, CENTER);   
   float textY = (border * 0.5f); 
   textSize(18);
   text("Average Attendances at Celtic Park 1980 - 2014", width * 0.5f, textY);
   textSize(14);
  
  drawAxis(data, 10, 10, 60000, border);   
  float windowRange = (width - (border * 2.0f));
  float dataRange = 60000;      
  //float lineWidth =  windowRange / (float) (data.size() - 1) ;
  
  
  
  for (int i = 1 ; i < data.size() ; i ++)
  {
    float x1 = map(i - 1, 0, data.size(), border, border + windowRange);
    float x2 = map(i, 0, data.size(), border, border + windowRange);
    float y1 = map(data.get(i - 1), 0, dataRange, height - border, (height - border) - windowRange);
    float y2 = map(data.get(i), 0, dataRange, height - border, (height - border) - windowRange);
    stroke(255,255,255);
    
    line(x1, y1, x2, y2);
    
  }  
}

void drawAxis(ArrayList<Float> data, int horizIntervals, int verticalIntervals, float vertDataRange, float border)
{
  stroke(255);
  
  fill(255);  
  
  // Draw the horizontal azis  
  line(border, height - border, width - border, height - border);
  
  float windowRange = (width - (border * 2.0f));  
  float tickSize = border * 0.1f;
      
  for (int i = 0 ; i <= horizIntervals ; i ++)
  {   
   // Draw the ticks
   float x = map(i, 0, horizIntervals, border, border + windowRange);
    line(x, height - (border - tickSize)
      , x, (height - border));    
      
   textAlign(CENTER, CENTER);   
   float textY = height - (border * 0.5f); 
   text((int) map(i, 0, horizIntervals, 1980, 2014), x, textY);
   
  } 
  
  // Draw the vertical axis
  line(border, border , border, height - border);
  
  for (int i = 0 ; i <= verticalIntervals ; i ++)
  {
    float y = map(i, 0, verticalIntervals, height - border,  border);
    line(border - tickSize, y, border, y);
    float hAxisLabel = map(i, 0, verticalIntervals, 0, vertDataRange);
        
    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }    
}

int mode = 0;
boolean flag = false;

void draw()
{
  drawTrendLineGraph(sums, "1980");
  
  image(crestImage, 0, 0, 70, 60);
  image(crestImage, 580, 0, 70, 60);




  
  switch(mode)
  {
     case 0:  
     displayMenu();
     flag = true;
     break;
     
     case 1:  displayGraph();
      flag = true;
      break; 
      
      case 2: displayFans();
      flag = true;
      break;
  

  }
}







void loadSums()
{
  String[] strings = loadStrings("sum.csv");
  
  for(String s:strings)
  {
    sums.add(parseFloat(s));
  }
  
}

void loadData()
{
  String[] strings = loadStrings("AverageAttendances1980-2014.csv");
  
  for(String s:strings)
  {
    println(s);
    String[] line = s.split(",");
    
    ArrayList<Float> lineData = new ArrayList<Float>();
    
    // Start at 1, so we skip the first one 
    for (int i = 1 ; i < line.length ; i ++)
    {
      lineData.add(Float.parseFloat(line[i]));              
    }
    data.add(lineData);
  }
}

void displayMenu()
{
  
  background(0, 128, 0);
  image(crestImage,220, 80, 200,200);
  fill(0);
  textSize(18);

  text("GLASGOW CELTIC FOOTBALL CLUB FAN HUB",525,20);
  text("Press 1 to see Average Attendances between 1980 - 2014", 600,350);
  text("Press 2 to see a breakdown of Celtic FC fans Worldwide", 575,370);

  text("Press 1 to see Average Attendances between 1980 - 2014", 600,350);

  
  
}

void displayGraph()
{
  
}




void displayFans()
{
  
  background(100);
  f = loadFont ("MicrosoftNewTaiLue-Bold-48.vlw");
  world = loadImage("world.jpg");
  smooth();
  for(int i=0; i<6; i++){
    int id = i;
    String n = name[i];
    int pop = fanBase[i];
    color c = color(random(0),random(200),random(0));
    blob[i] = new Blob((pop/10000000),(pop/10000000),c, n, id, pop);
}
image(world,0,0);
  
 for(int i=0; i<6; i++){
   blob[i].check();
   blob[i].info();
   
    blob[i].render();
 }
}

// key for case staetment
void keyPressed()
{
  if (key >= '0' && key <='2')
  {
    mode = key - '0';
  }
  println(mode);
}