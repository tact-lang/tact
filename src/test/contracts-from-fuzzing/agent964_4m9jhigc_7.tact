struct S1 {
  a: Int;
}

struct S2 {
  b: Bool;
}

struct S3 {
  c: Address;
}

contract ManyStructsFields {
  s1: S1;
  s2: S2;
  s3: S3;

  init() {
    self.s1 = S1{a: 1};
    self.s2 = S2{b: false};
    self.s3 = S3{c: myAddress()};
  }
}
