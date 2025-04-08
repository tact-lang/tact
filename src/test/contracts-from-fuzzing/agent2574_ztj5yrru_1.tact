struct Coord {
  x: Int;
  y: Int;
}

contract SingleStruct {
  coords: Coord;

  init() {
    self.coords = Coord{ x: 10, y: 20 };
  }
}