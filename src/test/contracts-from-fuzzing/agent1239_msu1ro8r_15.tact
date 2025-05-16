struct S1 {
  i: Int;
}
struct S2 {
  s: String;
}
struct S3 {
  b: Bool;
}

contract ManyStructs {
  s1: S1;
  s2: S2;
  s3: S3;

  init() {
    self.s1 = S1{i:1};
    self.s2 = S2{s:"hi"};
    self.s3 = S3{b:true};
  }
}