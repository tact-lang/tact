struct S1 {
  i: Int;
}

struct S2 {
  s: String;
}

struct S3 {
  b: Bool;
}

contract MixList {
  a: S1;
  b: S2;
  c: S3;

  init() {
    self.a = S1{i:1};
    self.b = S2{s:"s"};
    self.c = S3{b:true};
  }
}