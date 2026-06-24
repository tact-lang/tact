struct S1 {
  a: Int;
  b: Bool;
}

struct S2 {
  a: Int;
  s1: S1;
}

struct S3 {
  s2: S2;
  c: Int?;
}

contract Test {
  data: S3;

  init() {
    self.data = S3{
      s2: S2{a:5, s1: S1{a:1, b:true}},
      c: null,
    };
  }
}