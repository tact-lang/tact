struct Coord {
  x: Int;
  y: Int;
}

contract SingleStructField {
  coord: Coord;

  init() {
    self.coord = Coord{ x: 1, y: 2 };
  }
}