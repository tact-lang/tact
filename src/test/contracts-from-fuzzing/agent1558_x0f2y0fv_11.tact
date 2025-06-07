struct S1 {
  a: Int;
}

struct S2 {
  b: Int;
}

struct S3 {
  c: Int;
}

struct Wrap {
  x: S1;
  y: S2;
  z: S3;
}

contract MultiWrap {
  w: Wrap;

  init() {
    self.w = Wrap{
      x: S1{ a: 1 },
      y: S2{ b: 2 },
      z: S3{ c: 3 }
    };
  }
}