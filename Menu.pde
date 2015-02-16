class Menu
{
  Menu()
  {
    background(0);
    smooth();
  }
  public void draw()
  {    
    textSize(32);
    fill(255);
    text("Stack OR DIE!!", 400, 400);
    
    
    noStroke();
    if(mouseX > 475 && mouseX < 525 && mouseY > 475 && mouseY < 525) fill(127);
    else fill(255);
    ellipse(500, 500, 50, 50);
    
    
    textSize(16);
    fill(255);
    text("Play", 485, 550);
  
  }
  
  int isClicked()
  {
    if(mouseX > 475 && mouseX < 525 && mouseY > 475 && mouseY < 525)
    {
      return 1;
    }
    
    
    return 0;
  }
}
