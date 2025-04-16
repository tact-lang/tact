struct S1 { a: Int }
struct S2 { a: Int; b: Int }
struct S3 { a: Int; b: Int; c: Int }
struct S4 { a: Int; b: Int; c: Int; d: Int }

contract ManyNested {
  s1: S1;
  s2: S2;
  s3: S3;
  s4: S4;
  init() {
    self.s1 = S1{a:1};
    self.s2 = S2{a:1,b:2};
    self.s3 = S3{a:1,b:2,c:3};
    self.s4 = S4{a:1,b:2,c:3,d:4};
  }
}