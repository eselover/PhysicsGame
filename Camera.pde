class Camera
{
  Vec2 pos;
  PMatrix2D matrix = new PMatrix2D();

  void update(Body box1)
  {
    pos = box1.getPosition();
    matrix.reset();

    matrix.translate(width/2, height/2); // 3. move to center of the screen
    matrix.scale(.5); // 2. zoom in
    matrix.translate(-pos.x, -pos.y); // 1. move to the origin
  }

  PVector transformInverseMatrix(PVector v)
  {
    v = v.get();
    // do math
    PMatrix2D im = matrix.get(); // copy matrix
    im.invert();
    im.mult(v, v);
    return v;
  }
}

