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
final int   SETTING_WINDOW_SIZE_X   = 1600; 
final int   SETTING_WINDOW_SIZE_Y   =  800;
final int   SETTING_DOT_SIZE        =   10;

// Globals 
float g_x ; 
float g_y ; 

BufferedReader g_reader;
 

void setup() {
  
  // Set the background color to White = 255 
  background(0);
  
  // Set up the size of the window to a know value. 
  size(SETTING_WINDOW_SIZE_X, SETTING_WINDOW_SIZE_Y);

  // None of the objects that we draw should have borders.   
  noStroke();
  
  // Only run the Draw function once. 
  noLoop();    

  // Since it looks like my DNA goes up and to the left mostly. 
  // We want to start the sequence from the bottom right to give it enugh space to be shown.    
  g_x    = SETTING_DOT_SIZE ; 
  g_y    = SETTING_DOT_SIZE ; 
  
  // open the file for read. 
  g_reader = createReader("../dna.txt");  
  
  // Set the default color of the object 
  


  
}

void draw() {
  
  // A variable to store the line as it is read from the file. 
  String line;
  
  // Only read the first 40,000 lines from the file. 
  // for ( int count = 0 ; count < 1000 ; count++ ) {
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
  // Check to see if we have hit our limit 
  if( g_y + (SETTING_DOT_SIZE*2) > SETTING_WINDOW_SIZE_Y ) {
    // There is no more space for this dot. 
    // Nothing to do. 
    return ; 
  }
  
  
  // Direction 
  switch( first ) 
  {
    case 'A': // 65 
      fill(0, 0, 255 );
      stroke(0, 0, 255);
      break;   
    case 'C': // 67 
      fill(0, 255, 0 );
      stroke(0, 255, 0);
      break;   
    case 'T': // 84
      fill(255, 0, 0 );
      stroke(255, 0, 0);
      break;   
    case 'G': // 71 
      fill(0, 255, 255 );
      stroke(0, 255, 255);
      break;   
  } 
  
  fill(255, 255, 255 );
  strokeWeight(2);  // Thicker
  
  switch( second ) 
  {
    case 'A': // 65
      line(g_x, g_y+(SETTING_DOT_SIZE/2), g_x+SETTING_DOT_SIZE, g_y+(SETTING_DOT_SIZE/2));      
      break;   
    case 'C': // 67
      line(g_x+(SETTING_DOT_SIZE/2), g_y, g_x+(SETTING_DOT_SIZE/2), g_y+SETTING_DOT_SIZE);
      break;   
    case 'T': // 84
      line(g_x, g_y, g_x+SETTING_DOT_SIZE, g_y+SETTING_DOT_SIZE);      
      break;   
    case 'G': // 71
      line(g_x+SETTING_DOT_SIZE, g_y, g_x, g_y+SETTING_DOT_SIZE);      
      break;   
  }  
      
  
  // Draw a circle on the screen at the new location.   
  // ellipse( g_x, g_y, SETTING_DOT_SIZE, SETTING_DOT_SIZE );
  // rect( g_x, g_y, SETTING_DOT_SIZE, SETTING_DOT_SIZE );
  
  // Incurment 
  g_x += SETTING_DOT_SIZE ; 
  if( g_x + SETTING_DOT_SIZE*2 > SETTING_WINDOW_SIZE_X ) {
    // We finished a horazontal line. 
    // Move down one line and start again 
    g_y += SETTING_DOT_SIZE ; 
    g_x = SETTING_DOT_SIZE ;    
  }
  
}


