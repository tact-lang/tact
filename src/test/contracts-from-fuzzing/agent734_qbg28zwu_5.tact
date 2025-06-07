struct S {
  i1: Int;
  i2: Int;
  optional: String?;
}

contract TestContract {
  s1: S;
  s2: S;
  s3: S;

  init() {
    self.s1 = S{ i1:1,i2:2,optional:null };
    self.s2 = S{ i1:3,i2:4,optional:"foo" };
    self.s3 = S{ i1:5,i2:6,optional:null };
  }
}