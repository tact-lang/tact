struct Coord {
  x: Int;
  y: Int;
}

contract CoordArrayLike {
  c0: Coord;
  c1: Coord;
  c2: Coord;
  c3: Coord;
  c4: Coord;

  init() {
    self.c0 = Coord{x:0,y:0};
    self.c1 = Coord{x:1,y:1};
    self.c2 = Coord{x:2,y:2};
    self.c3 = Coord{x:3,y:3};
    self.c4 = Coord{x:4,y:4};
  }

  receive() {
    let _ = self.c2.x;
  }
}