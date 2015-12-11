
/* @pjs preload="bg2.jpg"; */
/* @pjs preload="asteroid-icon.png"; */
PImage bg;
PImage ast;
ArrayList <AsteroidsL> ceresL;
ArrayList <AsteroidsS> ceresS = new ArrayList<AsteroidsS>();
SpaceShip starfox; 
ArrayList <Bullets> one = new ArrayList<Bullets>();
boolean u = false;
boolean d = false;
boolean l = false;
boolean r = false;
int cNum;
public void setup() 
{
  size(800, 800);
  imageMode(CENTER);
  cNum = 10;
  bg = loadImage("bg2.jpg");
  ast = loadImage("asteroid-icon.png");
  starfox = new SpaceShip();
  ceresL = new ArrayList <AsteroidsL>();
  for (int i=0; i<cNum; i++)
  {
    ceresL.add(new AsteroidsL());
  }
}
public void draw() 
{
  //background(bg);
  image(bg,400,400,800,800);
  starfox.show();
  starfox.move();

  for (int i=0; i<one.size (); i++)
  {
    one.get(i).move();
    one.get(i).show();
    if(one.get(i).getX() > 798)
      one.remove(i);
  }

  for (int i=0; i<ceresL.size (); i++)
  {
    ceresL.get(i).move();
    ceresL.get(i).show();
  }
  for (int i=0; i<ceresS.size (); i++)
  {
    ceresS.get(i).move();
    ceresS.get(i).show();
  }

  for (int x=0; x<one.size (); x++)
  {
    for (int i=0; i<ceresL.size (); i++)

    {
      if (dist(ceresL.get(i).getX(), ceresL.get(i).getY(), one.get(x).getX(), one.get(x).getY())<30)
      {
        ceresL.remove(i);
        one.remove(x);
        ceresS.add(new AsteroidsS());
        ceresS.add(new AsteroidsS());
        break;
      }
    }
  }
   for (int x=0; x<one.size (); x++)
  {
    for (int i=0; i<ceresS.size (); i++)

    {
      if (dist(ceresS.get(i).getX(), ceresS.get(i).getY(), one.get(x).getX(), one.get(x).getY())<30)
      {
        ceresS.remove(i);
        one.remove(x);
        break;
      }
    }
  }
  if (l == true)
  {
    starfox.rotate(-8);
  }
  if (r == true)
  {
    starfox.rotate(8);
  }
  if (u == true)
  {
    starfox.accelerate(0.5);
  }
  if (d == true)
  {
    starfox.accelerate(-0.5);
  }
}
public void keyPressed()
{
  if (keyCode == LEFT)
  {
    l = true;
  }
  if (keyCode == RIGHT)
  {
    r = true;
  }
  if (keyCode == UP)
  {
    u = true;
  }
  if (keyCode == DOWN)
  {
    d = true;
  }
  if (keyCode == 72)
  {
    starfox.setX((int)(Math.random()*800)+1);
    starfox.setY((int)(Math.random()*800)+1);
    starfox.setDirectionX(0);
    starfox.setDirectionY(0);
    starfox.setPointDirection((int)(Math.random()*360));
  } 
  if (keyCode == 83)
  {
    one.add(new Bullets(starfox));
  }
}
public void keyReleased()
{
  if (keyCode == LEFT)
  {
    l = false;
  } else if (keyCode == RIGHT)
  {
    r = false;
  } else if (keyCode == UP)
  {
    u = false;
  } else if (keyCode == DOWN)
  {
    d = false;
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
    myRed = 128;
    myGreen = 128;
    myBlue = 128;
    myCenterX = 400;
    myCenterY = 400;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }
  public void setX(int x) { 
    myCenterX = x;
  }
  public int getX() { 
    return (int) myCenterX;
  }   
  public void setY(int y) { 
    myCenterY = y;
  }   
  public int getY() { 
    return (int)myCenterY;
  }   
  public void setDirectionX(double x) { 
    myDirectionX = x;
  }   
  public double getDirectionX() { 
    return myDirectionX;
  }   
  public void setDirectionY(double y) { 
    myDirectionY = y;
  }   
  public double getDirectionY() { 
    return myDirectionY;
  }   
  public void setPointDirection(int degrees) { 
    myPointDirection = degrees;
  }   
  public double getPointDirection() {
    return myPointDirection;
  }
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myRed, myGreen, myBlue);   
    strokeWeight(2);
    stroke(0);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for (int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated, yRotatedTranslated);
    }   
    endShape(CLOSE);
  }
}
class AsteroidsL extends Floater
{
  private int myRotation, rand;
  public AsteroidsL()
  {
    myCenterX = (int)(Math.random()*800);
    myCenterY = (int)(Math.random()*800);
    myDirectionX = Math.cos(Math.random()*2*Math.PI);
    myDirectionY = Math.sin(Math.random()*2*Math.PI);
    myPointDirection = 0;
    if (Math.random()>0.5) {
      myRotation = ((int)(Math.random()*2)+2)*(-1);
    } else {
      myRotation = ((int)(Math.random()*2)+2);
    }
  }
  public void setX(int x) { 
    myCenterX = x;
  }
  public int getX() { 
    return (int) myCenterX;
  }   
  public void setY(int y) { 
    myCenterY = y;
  }   
  public int getY() { 
    return (int)myCenterY;
  }   
  public void setDirectionX(double x) { 
    myDirectionX = x;
  }   
  public double getDirectionX() { 
    return myDirectionX;
  }   
  public void setDirectionY(double y) { 
    myDirectionY = y;
  }   
  public double getDirectionY() { 
    return myDirectionY;
  }   
  public void setPointDirection(int degrees) { 
    myPointDirection = degrees;
  }   
  public double getPointDirection() {
    return myPointDirection;
  } 
  public void move()
  {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
    myPointDirection += myRotation;   
    if (myCenterX >width+100)
    {     
      myCenterX = 0-50;
    } else if (myCenterX<0-100)
    {     
      myCenterX = width+50;
    }    
    if (myCenterY > height+100)
    {    
      myCenterY = 0-50;
    } else if (myCenterY <0-100)
    {     
      myCenterY = height+50;
    }
  }
  public void show()
  {            
    image(ast, (float)myCenterX, (float)myCenterY, (float)150, (float)150);
  }
}   

class AsteroidsS extends Floater
{
  private int myRotation, rand;
  public AsteroidsS()
  {
    myCenterX = (int)(Math.random()*800);
    myCenterY = (int)(Math.random()*800);
    myDirectionX = Math.cos(Math.random()*2*Math.PI);
    myDirectionY = Math.sin(Math.random()*2*Math.PI);
    myPointDirection = 0;
    if (Math.random()>0.5) {
      myRotation = ((int)(Math.random()*2)+2)*(-1);
    } else {
      myRotation = ((int)(Math.random()*2)+2);
    }
  }
  public void setX(int x) { 
    myCenterX = x;
  }
  public int getX() { 
    return (int) myCenterX;
  }   
  public void setY(int y) { 
    myCenterY = y;
  }   
  public int getY() { 
    return (int)myCenterY;
  }   
  public void setDirectionX(double x) { 
    myDirectionX = x;
  }   
  public double getDirectionX() { 
    return myDirectionX;
  }   
  public void setDirectionY(double y) { 
    myDirectionY = y;
  }   
  public double getDirectionY() { 
    return myDirectionY;
  }   
  public void setPointDirection(int degrees) { 
    myPointDirection = degrees;
  }   
  public double getPointDirection() {
    return myPointDirection;
  } 
  public void move()
  {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
    myPointDirection += myRotation;   
    if (myCenterX >width+100)
    {     
      myCenterX = 0-50;
    } else if (myCenterX<0-100)
    {     
      myCenterX = width+50;
    }    
    if (myCenterY > height+100)
    {    
      myCenterY = 0-50;
    } else if (myCenterY <0-100)
    {     
      myCenterY = height+50;
    }
  }
  public void show()
  {            
    image(ast, (float)myCenterX, (float)myCenterY, (float)60, (float)60);
  }
}   

class Bullets extends Floater
{

  public Bullets(SpaceShip x)
  {
    double dRadiansship = (x.myPointDirection)*(Math.PI/180);
    myCenterX = x.getX();
    myCenterY = x.getY();
    myPointDirection = x.getPointDirection();
    double dRadians =myPointDirection*(Math.PI/180); 
    myDirectionX = 5 * Math.cos(dRadians) + x.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + x.getDirectionY();
  }
  public void setX(int x) { 
    myCenterX = x;
  }
  public int getX() { 
    return (int) myCenterX;
  }   
  public void setY(int y) { 
    myCenterY = y;
  }   
  public int getY() { 
    return (int)myCenterY;
  }   
  public void setDirectionX(double x) { 
    myDirectionX = x;
  }   
  public double getDirectionX() { 
    return myDirectionX;
  }   
  public void setDirectionY(double y) { 
    myDirectionY = y;
  }   
  public double getDirectionY() { 
    return myDirectionY;
  }   
  public void setPointDirection(int degrees) { 
    myPointDirection = degrees;
  }   
  public double getPointDirection() {
    return myPointDirection;
  } 
  public void show()
  {
    strokeWeight(10);
    stroke(255,0,0,30);
    fill(255);
    ellipse((float)myCenterX, (float)myCenterY, 6, 6);
  }
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
  }
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
    if (myCenterX >width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
    {     
      myCenterY = height;
    }
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myRed, myGreen, myBlue);   
    stroke(0);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for (int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated, yRotatedTranslated);
    }   
    endShape(CLOSE);
  }
} 
