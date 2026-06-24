struct S1 {
  x: Int;
  y: Int;
}

struct S2 {
  a: S1;
  b: Int;
}

struct S3 {
  s: S2;
}

contract Chain {
  val: S3;
  init() {
    self.val = S3{ s: S2{ a: S1{ x:1, y:2 }, b:3 } };
  }
}