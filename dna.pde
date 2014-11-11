

float x ; 
float y ; 
float speed ; 
int dot_sizex ;
int dot_sizey ; 
int alpha ; 

int statsA ;
int statsC ;
int statsT ;
int statsG ;

BufferedReader reader;
 

void setup() {
  background(255);
  size(800, 1600);
  
  noStroke();
  noLoop();  // Draw only one time
  
//  x         = 640 / 2 ; 
//  y         = 360 / 2 ; 
  x         =   800 ; 
  y         =  1600 ; 
  speed     =   0.5 ; 
  dot_sizex =    10 ;
  dot_sizey =    10 ;
  alpha     =     1 ; 
  
  reader = createReader("dna.txt");  
  
  
}

/*
# chromosome   position    genotype
       1       82154       AA (1)
       1       752566      AG (2)
       1       752721      AG (2)
       1       776546      AG (2) 
       1       798959      AG (2)
       1       800007      CC (3)
       1       838555      AC (4)
       1       846808      CT (5)
*/

void draw() {
  
  fill(0, 0, 255, alpha );

  int count = 40000 ; 

  String line;
  while ( count > 0 ) 
  {
    count-- ; 
    
    try {
      line = reader.readLine();
      
      char i  = line.charAt(0);
      char i2 = line.charAt(1);

      println("line=[" + line + "] i=[" +  i + "] i2=[" + i2 + "] ");
      Doit( i, i2 );      
      
    } catch (IOException e) {
      e.printStackTrace();
    }  
  }
  
  println( "statsA=["+ statsA + "] "); 
  println( "statsC=["+ statsC + "] "); 
  println( "statsT=["+ statsT + "] "); 
  println( "statsG=["+ statsG + "] "); 
  
}



void Doit( int direction, int linecolor ) 
{
  
  // Direction 
  switch( direction ) 
  {
    case 'A': // 65 
      x += speed*2 ;
      statsA ++; 
      break;   
    case 'C': // 67 
      x -= speed*2 ;
      statsC ++; 
      break;   
    case 'T': // 84
      y += speed ;
      statsT ++; 
      break;   
    case 'G': // 71 
      y -= speed ;
      statsG ++; 
      break;   
  } 
    
    /*
  // Direction 
  switch( linecolor ) 
  {
    case 'A': // 65 
      x -= speed ;
      statsA ++; 
      break;   
    case 'C': // 67 
      x += speed ;
      statsC ++; 
      break;   
    case 'T': // 84
      y -= speed ;
      statsT ++; 
      break;   
    case 'G': // 71 
      y += speed ;
      statsG ++; 
      break;   
  }   
*/  
    
  /*
  // Color 
  switch( linecolor ) {
    case 'A':
      fill(255,0,0);
      break;   
    case 'C':
      fill(0,255,0);
      break;   
    case 'T':
      fill(0,0,255);
      break;   
    case 'G':
      fill(0,255,255);
      break;       
  }
  */

  
  // Draw shit.   
  ellipse(x, y, dot_sizex, dot_sizey );  
}


