struct Deep3 {
  c: Int;
  d: Bool;
}

struct Deep2 {
  b: Deep3;
  y: Bool;
}

struct Deep1 {
  a: Deep2;
  x: Int;
}

contract TestContract {
  deepNest: Deep1;

  init() {
    self.deepNest = Deep1{
      a: Deep2{
        b: Deep3{ c: 7, d: true },
        y: false
      },
      x: 1
    };
  }
}