import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.*;
import org.jbox2d.collision.shapes.PolygonShape;

class Level1
{

  World world;
  float timeStep = 1.0/30.0;
  int offsetx = 40;
  int offsety = 40;
  Body mainBox;
  Body box2, box3, box4;
  Body floor1;
  Body floor2;
  Camera cam = new Camera();
  
  public int LEVEL = 1;
  
  int countx = 0;
  int county = 0;

  // true has positive x directions              false has negitive x direction
  boolean direction = false;
  boolean direction2 = false;

  int mouseClick = 0;

  Level1()
  {
    size(1000, 800);
    world = new World(new Vec2(0, 50));

    floor1 = makeABox(new Vec2(400, 600), 100, 10, 1);
    floor2 = makeABox(new Vec2(800, 600), 100, 10, 1);
    mainBox = makeABox(new Vec2(500, 20), 30, 30, 2);
    mainBox.setAngularVelocity(1);
    
    
    box2 = makeABox(new Vec2(300, 1500), 50, 50, 3);
    box2.setAngularVelocity(5);
    
    box3 = makeABox(new Vec2(500, 1500), 50, 50, 3);
    box3.setAngularVelocity(-5);
    
    box4 = makeABox(new Vec2(700, 1500), 50, 50, 3);
    box4.setAngularVelocity(4);

    
  }

  void update()
  {
    world.step(timeStep, 6, 2);
    cam.update(mainBox);
    for (Body body = world.getBodyList (); body != null; body = body.getNext())
    {
      if (floor1.getPosition().x >= 500) direction = !direction;
      else if (floor1.getPosition().x <= 300) direction = !direction;

      if (direction) floor1.setTransform(new Vec2(floor1.getPosition().x + 1, floor1.getPosition().y), 0.0);
      if (!direction) floor1.setTransform(new Vec2(floor1.getPosition().x - 1, floor1.getPosition().y), 0.0);

      if (floor2.getPosition().x >= 900) direction2 = !direction2;
      else if (floor2.getPosition().x <= 600) direction2 = !direction2;

      if (direction2) floor2.setTransform(new Vec2(floor2.getPosition().x + 1, floor2.getPosition().y), 0.0);
      if (!direction2) floor2.setTransform(new Vec2(floor2.getPosition().x - 1, floor2.getPosition().y), 0.0);
    }
  }
  void draw()
  {
    update();
    background(0);

    pushMatrix();
    applyMatrix(cam.matrix);
    for (Body body = world.getBodyList (); body != null; body = body.getNext())
    {
      drawBody(body);
    }  
        
    noStroke();
    fill(255);
    ellipse(500, 2000, 50,50);
    
    stroke(255);
    noFill();
    ellipse(500, 2000, 80, 80);
    popMatrix();
  }

  void drawBody(Body body)
  {
    PolygonShape ps = (PolygonShape)body.getFixtureList().getShape();
    Vec2[] verts = ps.getVertices();
    Vec2 pos = body.getPosition();

    noStroke();

    fill(255);

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(body.getAngle());
    beginShape();
    for (int i = 0; i < ps.getVertexCount (); i++)
    {
      vertex(verts[i].x, verts[i].y);
    }
    endShape();
    popMatrix();
  }
  Body makeABox(Vec2 pos, float w, float h, int type)
  {
    BodyDef def = new BodyDef();
    switch(type)
    {
    case 1:
      def.type = BodyType.STATIC;
      break;
    case 2:
      def.type = BodyType.DYNAMIC;
      break;
    case 3:
      def.type = BodyType.KINEMATIC;
      break;
    default:
      def.type = BodyType.DYNAMIC;
      break;
    }
    def.position = pos;

    Body body = world.createBody(def);

    PolygonShape shape = new PolygonShape();
    shape.setAsBox(w, h);

    FixtureDef fixture = new FixtureDef();
    fixture.shape = shape;
    fixture.density = 1;
    fixture.friction = .5;
    fixture.restitution = 0;

    body.createFixture(fixture);

    return body;
  }
  
  void keyPressed()
  {
    if(keyCode == UP)
    {
      mainBox.setTransform(new Vec2(mainBox.getPosition().x, mainBox.getPosition().y - 10.0), 0.0);
    }
    
    if(keyCode == DOWN)
    {
      mainBox.setTransform(new Vec2(mainBox.getPosition().x, mainBox.getPosition().y + 10.0), 0.0);
    }
    
    if(keyCode == LEFT)
    {
      mainBox.setTransform(new Vec2(mainBox.getPosition().x - 10.0, mainBox.getPosition().y), 0.0);
    }
    
    if(keyCode == RIGHT)
    {
      mainBox.setTransform(new Vec2(mainBox.getPosition().x + 10.0, mainBox.getPosition().y), 0.0);
    }
  }
}

