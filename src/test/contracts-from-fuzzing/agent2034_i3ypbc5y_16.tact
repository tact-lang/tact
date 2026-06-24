struct Point {
  x: Int;
  y: Int;
}

struct Triangle {
  p1: Point;
  p2: Point;
  p3: Point;
}

struct Poly {
  t1: Triangle;
  t2: Triangle;
  t3: Triangle;
}

contract BigPoly {
  polygon: Poly;

  init() {
    self.polygon = Poly{
      t1: Triangle{ p1: Point{x:1,y:1}, p2:Point{x:2,y:2}, p3:Point{x:3,y:3} },
      t2: Triangle{ p1: Point{x:4,y:4}, p2:Point{x:5,y:5}, p3:Point{x:6,y:6} },
      t3: Triangle{ p1: Point{x:7,y:7}, p2:Point{x:8,y:8}, p3:Point{x:9,y:9} }
    };
  }
}