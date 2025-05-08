struct S1 {
  a: Int;
  b: String;
}

struct S2 {
  c: Bool;
  s: S1;
}

struct S3 {
  d: Address;
  t: S2;
}

contract VeryDeep {
  s3: S3;

  init() {
    self.s3 = S3{
      d: myAddress(),
      t: S2{ c:true, s: S1{a:42, b:"hi"} }
    };
  }
}