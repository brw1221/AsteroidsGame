PImage bg;
SpaceShip starfox; //your varhiable declarations here
public void setup() 
{
  size(800,800);
  bg = loadImage("bg2.jpg");
  starfox = new SpaceShip();
}
public void draw() 
{
  imageMode(CENTER);
  image(bg,400,400,800,800);
  starfox.show();
  starfox.move();
}
public void keyPressed()
{
  if(keyCode == LEFT)
  {
    starfox.rotate(-8);
  }
  else if(keyCode == RIGHT)
  {
    starfox.rotate(8);
  }
  else if(keyCode == UP)
  {
    starfox.accelerate(0.5);
  }
  else if(keyCode == DOWN)
  {
    starfox.accelerate(-0.5);
  }
  else if(keyCode == 72)
  {
    starfox.setX((int)(Math.random()*800)+1);
    starfox.setY((int)(Math.random()*800)+1);
    starfox.setDirectionX(0);
    starfox.setDirectionY(0);
  }  
}
class SpaceShip extends Floater  
{   
    public SpaceShip()
    {
      corners = 23;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = 28;
      yCorners[0] = -0;
      xCorners[1] = 16;
      yCorners[1] = -6;
      xCorners[2] = 0;
      yCorners[2] = -8;
      xCorners[3] = 0;
      yCorners[3] = -14;
      xCorners[4] = -6;
      yCorners[4] = -20;
      xCorners[5] = 0;
      yCorners[5] = -22;
      xCorners[6] = -10;
      yCorners[6] = -24;
      xCorners[7] = -14;
      yCorners[7] = -28;
      xCorners[8] = -20;
      yCorners[8] = -24;
      xCorners[9] = -16;
      yCorners[9] = -8;
      xCorners[10] = -24;
      yCorners[10] = -4;
      xCorners[11] = -28;
      yCorners[11] = -4;
      xCorners[12] = -28;
      yCorners[12] = 4;
      xCorners[13] = -24;
      yCorners[13] = 4;
      xCorners[14] = -16;
      yCorners[14] = 8;
      xCorners[15] = -20;
      yCorners[15] = 24;
      xCorners[16] = -14;
      yCorners[16] = 28;
      xCorners[17] = -10;
      yCorners[17] = 24;
      xCorners[18] = 0;
      yCorners[18] = 22;
      xCorners[19] = -6;
      yCorners[19] = 20;
      xCorners[20] = 0;
      yCorners[20] = 14;
      xCorners[21] = 0;
      yCorners[21] = 8;
      xCorners[22] = 16;
      yCorners[22] = 6;
      myRed = 255;
      myGreen = 255;
      myBlue = 255;
      myCenterX = 400;
      myCenterY = 400;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
    }
    public void setX(int x) { myCenterX = x; }
    public int getX() { return (int) myCenterX; }   
    public void setY(int y) { myCenterY = y; }   
    public int getY() { return (int)myCenterY; }   
    public void setDirectionX(double x) { myDirectionX = x; }   
    public double getDirectionX() { return myDirectionX; }   
    public void setDirectionY(double y) { myDirectionY = y; }   
    public double getDirectionY() { return myDirectionY; }   
    public void setPointDirection(int degrees) { myPointDirection = degrees; }   
    public double getPointDirection() {return myPointDirection; } 

}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myRed;
  protected int myBlue;
  protected int myGreen;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myRed,myGreen,myBlue);   
    stroke(0);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

