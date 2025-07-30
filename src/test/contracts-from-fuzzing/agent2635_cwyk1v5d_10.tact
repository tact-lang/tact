struct S1 {
  a: Int;
}

struct S2 {
  b: Int;
}

struct S3 {
  c: S1;
  d: S2;
}

contract MultiStruct {
  s: S3;

  init() {
    self.s = S3{
      c: S1{a:1},
      d: S2{b:2}
    };
  }
}