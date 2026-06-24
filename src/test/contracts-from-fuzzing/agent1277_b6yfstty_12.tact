struct S1 {
  a: Int;
  b: Bool;
}

struct S2 {
  c: String;
  d: Address;
}

struct S3 {
  s1: S1;
  s2: S2;
  opt: Int?;
}

contract TestContract {
  s3: S3;
  init() {
    self.s3 = S3{
      s1: S1{a:1,b:true},
      s2: S2{c:"hi", d:myAddress()},
      opt: null
    };
  }
}