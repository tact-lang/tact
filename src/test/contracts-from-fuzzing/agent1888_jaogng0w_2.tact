struct Nest {
  x: Int;
  b: Bool;
  opt: Int?;
}

struct Deep {
  a: Nest;
  b: Int;
  c: Bool;
  d: Nest;
}

contract Persist {
  item: Deep;

  init() {
    self.item = Deep{
      a: Nest{x: 1, b: true, opt: null},
      b: 10,
      c: false,
      d: Nest{x: 2, b: false, opt: 5}
    };
  }
}
