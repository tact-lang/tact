struct S1 {
  a: Int;
}

struct S2 {
  b: Int;
}

struct S3 {
  c: Int;
}

struct S4 {
  d: Int;
}

struct Huge {
  x1: S1;
  x2: S2;
  x3: S3;
  x4: S4;
  y: Int;
}

contract Hundreds {
  storage: Huge;

  init() {
    self.storage = Huge{
      x1: S1{a:1},
      x2: S2{b:2},
      x3: S3{c:3},
      x4: S4{d:4},
      y: 5
    };
  }
}