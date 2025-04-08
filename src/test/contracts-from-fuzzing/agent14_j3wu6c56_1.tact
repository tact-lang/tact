struct Coord {
  x: Int;
  y: Int;
}

contract BasicNested {
  loc: Coord;

  init() {
    self.loc = Coord{ x: 1, y: 2 };
  }
}