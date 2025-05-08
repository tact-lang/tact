struct S0 { f0: Int; }
struct S1 { f1: Int; }
struct S2 { f2: Int; }
struct S3 { f3: Int; }
struct S4 { f4: Int; }

contract ManyStructTypes {
  s0: S0;
  s1: S1;
  s2: S2;
  s3: S3;
  s4: S4;

  init() {
    self.s0 = S0{f0:0};
    self.s1 = S1{f1:1};
    self.s2 = S2{f2:2};
    self.s3 = S3{f3:3};
    self.s4 = S4{f4:4};
  }
}