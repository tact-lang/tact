struct S1 {
  a: Int;
}

struct S2 {
  b: Int;
}

struct S3 {
  c: Int;
}

struct Packed {
  s1: S1;
  s2: S2;
  s3: S3;
  d: Int;
}

contract TestContract {
  packed: Packed;

  init() {
    self.packed = Packed{
    s1: S1{a:1},
    s2: S2{b:2},
    s3: S3{c:3},
    d: 4
    };
  }
}