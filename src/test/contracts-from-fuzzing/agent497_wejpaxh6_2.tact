struct Coord {
  x: Int;
  y: Int;
}

struct Container {
  a: Coord;
  b: Coord;
}

contract TestContract {
  data: Container;

  init() {
    self.data = Container{
      a: Coord{x: 1, y: 2},
      b: Coord{x: 3, y: 4},
    };
  }
}