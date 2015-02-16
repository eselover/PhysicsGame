import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.*;
import org.jbox2d.collision.shapes.PolygonShape;

Level1 level;
Menu menu;

int levelNum = 0;

void setup()
{
  size(1000, 800);

  level = new Level1();
  menu = new Menu();
  
}

void draw()
{
  switch(levelNum)
  {
  case 0:
    menu.draw();
    break;
  case 1:

    level.draw();
    break;
  case 2:
    //level two;
    break;
  case 3:
    //credits screen
    break;
  case 4:
    // Instructions Screen
    break;
  default:
    break;
  }
  
  levelNum = level.LEVEL;
}
void keyPressed()
{
  if(levelNum == 1)
  {
    level.keyPressed();
  }
}

void mousePressed()
{
  
  if(levelNum == 0)
  {
    levelNum = menu.isClicked();
  }
}

