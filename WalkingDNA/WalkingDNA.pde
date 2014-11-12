/*** 
 * MyDNA - WalkingDNA
 * 
 * Created by Steven Smethurst (Abluestar.com)
 * Created on: Nov 10, 2014 
 *
 * DNA.txt file example 
 * AA, AG, AG, AG, AG, CC, AC, CT, AG, GG, GT
 */

// Constants 
final int   SETTING_WINDOW_SIZE_X   =  800 ; 
final int   SETTING_WINDOW_SIZE_Y   = 1600 ;
final int   SETTING_DOT_SIZE        =   10 ;
final float SETTING_SPEED           =  0.5f;

// Globals 
float g_x ; 
float g_y ; 

BufferedReader g_reader;
 

void setup() {
  
  // Set the background color to White = 255 
  background(255);
  
  // Set up the size of the window to a know value. 
  size(SETTING_WINDOW_SIZE_X, SETTING_WINDOW_SIZE_Y);

  // None of the objects that we draw should have borders.   
  noStroke();
  
  // Only run the Draw function once. 
  noLoop();    

  // Since it looks like my DNA goes up and to the left mostly. 
  // We want to start the sequence from the bottom right to give it enugh space to be shown.    
  g_x    = SETTING_WINDOW_SIZE_X ; 
  g_y    = SETTING_WINDOW_SIZE_Y ; 
  
  // open the file for read. 
  g_reader = createReader("../dna.txt");  
  
  // Set the default color of the object 
  fill(0, 0, 255, 1 );


  
}

void draw() {
  
  // A variable to store the line as it is read from the file. 
  String line;
  
  // Only read the first 40,000 lines from the file. 
  // for ( int count = 0 ; count < 40000 ; count++ ) {
  while( true ) {
    try {
      // Try to read a line from the file. 
      line = g_reader.readLine();
    } catch (IOException e) {
      e.printStackTrace();
      
      println( "Error: Could not read a new line from the dna.txt file"); 
      break; 
    }  
    
    if( line == null ) {
      println("line == NULL" ); 
      break; 
    }
    
    if( line.length() < 2 ) {
      println("line.length="+ line.length() ); 
      continue ; 
    }
    
    
    // Process the line and extract the DNA letters. 
    char i  = line.charAt(0);
    char i2 = line.charAt(1);

    // Debug, print the line and the extracted variables to the consol. 
    println("line=[" + line + "] i=[" +  i + "] i2=[" + i2 + "] ");
    
    // Draw this pair to the screen.  
    DrawDNAPair( i, i2 );      
  }
}



void DrawDNAPair( char first, char second ) 
{
  
  // Direction 
  switch( first ) 
  {
    case 'A': // 65 
      g_x += SETTING_SPEED*2 ;
      break;   
    case 'C': // 67 
      g_x -= SETTING_SPEED*2 ;
      break;   
    case 'T': // 84
      g_y += SETTING_SPEED ;
      break;   
    case 'G': // 71 
      g_y -= SETTING_SPEED ;
      break;   
  } 
  
  // Draw a circle on the screen at the new location.   
  ellipse( g_x, g_y, SETTING_DOT_SIZE, SETTING_DOT_SIZE );  
}


