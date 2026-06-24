struct Coord {
  a: Int;
  b: Int;
}

struct Box {
  topLeft: Coord;
  bottomRight: Coord;
}

contract NestedStructField {
  bounds: Box;

  init() {
    self.bounds = Box{
      topLeft: Coord{ a: 0, b: 0 },
      bottomRight: Coord{ a: 10, b: 10 }
    };
  }
}