Star[] star;

SpaceShip bob = new SpaceShip();
Bullet cho = new Bullet(bob);
ArrayList <Asteroids> theList;
ArrayList <Bullet> bulletList;
boolean leftIsPressed = false;
boolean rightIsPressed = false;
boolean upIsPressed = false;
boolean spaceIsPressed = false;
boolean rIsPressed = false;
boolean gg = false;
public void setup() 
{
  size(500,500,P2D);
  star = new Star[75];
  for(int i = 0;i<star.length;i++)
  {
  star[i] = new Star();  
  }
  theList = new ArrayList <Asteroids> ();
  for(int i = 0;i<7;i++)
  {
  theList.add(new Asteroids());  
  }
  bulletList = new ArrayList <Bullet> ();
  
}
public void draw() 
{
  if (gg == false)
  {
  background(218,165,32);
  bob.show();
  bob.move();
  if(leftIsPressed==true){
  bob.rotate(-2);
  }
  if(rightIsPressed==true){
  bob.rotate(2);
  }
  if(upIsPressed==true){
  bob.accelerate(.05);
  }
  if(spaceIsPressed==true){
  bob.setX((int)(Math.random()*500)+1);
  bob.getX();
  bob.setY((int)(Math.random()*500)+1);
  bob.getY();
  bob.setDirectionX(0);
  bob.getDirectionX();
  bob.setDirectionY(0);
  bob.getDirectionY();
  bob.setPointDirection((int)(Math.random()*360)+1);
  bob.getPointDirection();
  }

  
  for(int i = 0;i<star.length;i++)
  {
  star[i].show();  
  }
  for(int i = 0;i<theList.size();i++)
  {
  theList.get(i).show();  
  theList.get(i).move();
  }
  for(int o = 0;o<bulletList.size();o++)
  {
  bulletList.get(o).show();  
  bulletList.get(o).move();
  if (bulletList.get(o).getAge()>60)
  bulletList.remove(o);
  }
  if (theList.size()==3){
    for(int i = 0;i<7;i++)
    {
      theList.add(new Asteroids());  
    }
  }
  for(int i = 0;i<theList.size();i++)
    for(int o = 0;o<bulletList.size();o++)
  if (dist(theList.get(i).getX(),theList.get(i).getY(),bulletList.get(o).getX(),bulletList.get(o).getY())<20){
    theList.remove(i);
    bulletList.remove(o);
    break;
  }
  for(int i = 0;i<theList.size();i++)
    if (dist(theList.get(i).getX(),theList.get(i).getY(),bob.getX(),bob.getY())<20){
    theList.remove(i);
    gg = true;
    }
  }
  else
  {
  background(107,142,35);
  fill(250,0,0);
  text("gg",225,250);
  text("Press R to restart",210,270);
  bob.setX(250); 
  bob.getX();
  bob.setY(250);
  bob.getY();
  bob.setDirectionX(0);
  bob.getDirectionX();
  bob.setDirectionY(0);
  bob.getDirectionY(); 
  bob.setPointDirection(50);
  bob.getPointDirection();
  }
  if(rIsPressed==true){
  background(0);
  
  
  
  if(leftIsPressed==true){
  bob.rotate(-2);
  }
  if(rightIsPressed==true){
  bob.rotate(2);
  }
  if(upIsPressed==true){
  bob.accelerate(.05);
  }
  if(spaceIsPressed==true){
  bob.setX((int)(Math.random()*500)+1);
  bob.getX();
  bob.setY((int)(Math.random()*500)+1);
  bob.getY();
  bob.setDirectionX(0);
  bob.getDirectionX();
  bob.setDirectionY(0);
  bob.getDirectionY();
  bob.setPointDirection((int)(Math.random()*360)+1);
  bob.getPointDirection();
  }
  for(int i = 0;i<star.length;i++)
  {
  star[i].show();  
  }
  for(int i = 0;i<theList.size();i++)
  {
  theList.get(i).show();  
  theList.get(i).move();
  }
  for(int o = 0;o<bulletList.size();o++)
  {
  bulletList.get(o).show();  
  bulletList.get(o).move();
  if (bulletList.get(o).getAge()>60)
  bulletList.remove(o);
  }

  for(int i = 0;i<theList.size();i++)
    for(int o = 0;o<bulletList.size();o++)
  if (dist(theList.get(i).getX(),theList.get(i).getY(),bulletList.get(o).getX(),bulletList.get(o).getY())<20){
    theList.remove(i);
    bulletList.remove(o);
  }
  for(int i = 0;i<theList.size();i++)
    if (dist(theList.get(i).getX(),theList.get(i).getY(),bob.getX(),bob.getY())<20){
    theList.remove(i);
    gg = true;
    }
  }
}

    

class SpaceShip extends Floater  
{
  public SpaceShip()
  {
    corners = 14;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 30; yCorners[0] = 30;
    xCorners[2] = 27; yCorners[2] = -27;
    xCorners[3] = 24; yCorners[3] = 24;
    xCorners[4] = 21; yCorners[4] = -21;
    xCorners[5] = 18; yCorners[5] = 18;
    xCorners[6] = 15; yCorners[6] = -15;
    xCorners[7] = 12; yCorners[7] = 12;
    xCorners[8] = 9; yCorners[8] = -9;
    xCorners[9] = 6; yCorners[9] = 6;
    xCorners[10] = 3; yCorners[10] = -3; 
    xCorners[11] = 0; yCorners[11] = -0;
    xCorners[12] = -3; yCorners[12] = 3;
    xCorners[13] = -6; yCorners[13] = 3;
    


    myColor = color(240,120,140);
    //coordinates
    myCenterX = (int)width/2;
    myCenterY = (int)height/2;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;

  }

    public void setX(int x){myCenterX=x;}
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY=y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX=x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY=y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection=degrees;}
    public double getPointDirection(){return myPointDirection;} 
}
    

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
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
    fill(myColor);   
    stroke(myColor);    
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

public void keyPressed()
{
  if(keyCode==37)
  {
  leftIsPressed = true;  
  }
  else if(keyCode==39)
  {
  rightIsPressed = true;  
  }
  else if(keyCode ==38)
  {
  upIsPressed = true;  
  }
  else if(keyCode == 32)
  {
  spaceIsPressed = true;
  }
  else if(keyCode == 69 ) 
  {
  bulletList.add(new Bullet(bob)); 
  } 
  else if (keyCode==82)
  {
  gg=false;
  }
}
public void keyReleased()
{
  if(keyCode==37)
  {
  leftIsPressed = false;  
  }
  else if(keyCode==39)
  {
  rightIsPressed = false;  
  }
  else if(keyCode ==38)
  {
  upIsPressed = false;  
  }
  else if(keyCode == 32)
  {
  spaceIsPressed = false; 
  } 
  else if (keyCode==82)
  {
   rIsPressed = false;
  }
  
   
} 
class Star 
 {
  int x; 
  int y;
  Star()  
  {
    x=(int)(Math.random()*500)+1;
    y=(int)(Math.random()*500)+1;
  }
  void show()
  {
  fill(178,134,11);
  ellipse(x,y,3,3);  
  }
}

class Asteroids extends Floater
{
private int rotspeed;
  public Asteroids()
  {
  corners = 3;
  xCorners = new int [corners];
  yCorners = new int [corners]; 
  xCorners[0]=-20;
  yCorners[0]=-20;
  xCorners[1]=20;
  yCorners[1]=-20;
  xCorners[2]=20;
  yCorners[2]=20;
  myColor=color(238,221,130);
  myCenterX = (int)(Math.random()*500)+1; 
  myCenterY = (int)(Math.random()*500)+1;   
  myDirectionX=(int)(Math.random()*10)-5;
  myDirectionY=(int)(Math.random()*10)-5;  
  rotspeed=(int)(Math.random()*4)+2;
  }
  public void setX(int x){myCenterX=x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY=y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX=x;}    public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY=y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection=degrees;}
  public double getPointDirection(){return myPointDirection;} 
  
  public void move()
  {
    super.move();
    myPointDirection+=rotspeed;
  }
}
class Bullet extends Floater
{
  private int myAge;
  public Bullet(SpaceShip bob)
  {
    myCenterX = bob.getX();
    myCenterY = bob.getY();
    myPointDirection = bob.getPointDirection();
    double dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + bob.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + bob.getDirectionY();
    myAge = 0;
  }
  public void setX(int x){myCenterX=x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY=y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX=x;}    public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY=y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection=degrees;}
  public double getPointDirection(){return myPointDirection;} 
  
  public int getAge(){
    return myAge;
  }
  public void show()
  { 

   fill(255,0,0);
   stroke( 34, 139, 34);
   ellipse((float)myCenterX,(float)myCenterY,10,10);
   myAge++;

  }
} 
