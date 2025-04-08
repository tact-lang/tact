struct Point { x: Int; y: Int? }

struct Params {
  a: Point;
  b: Point;
  c: Point;
}

contract TestContract {
  f: Params;

  init() {
    self.f = Params{
      a: Point{ x: 1, y: null },
      b: Point{ x: 2, y: 3 },
      c: Point{ x: 4, y: null }
    };
  }
}