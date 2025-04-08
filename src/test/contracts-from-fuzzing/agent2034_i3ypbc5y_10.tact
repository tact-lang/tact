struct Coord {
  x: Int;
  y: Int;
}

struct Poly {
  p1: Coord;
  p2: Coord;
  p3: Coord;
  p4: Coord;
  p5: Coord;
  p6: Coord;
}

contract PolygonStore {
  poly: Poly;

  init() {
    self.poly = Poly{
      p1: Coord{ x:1,y:1 },
      p2: Coord{ x:2,y:2 },
      p3: Coord{ x:3,y:3 },
      p4: Coord{ x:4,y:4 },
      p5: Coord{ x:5,y:5 },
      p6: Coord{ x:6,y:6 }
    };
  }
}