struct S1 {
  a: Int;
  b: Int?;
}

struct S2 {
  c: S1;
  d: S1;
}

struct S3 {
  e: S2;
  f: S2;
}

contract NestedMany {
  s: S3;
  init() {
    self.s = S3{
      e: S2{c: S1{a:1, b:null}, d:S1{a:2,b:null}},
      f: S2{c: S1{a:3, b: null}, d:S1{a:4,b:null}}
    };
  }
}