struct S {
  s1: Int;
  s2: String;
  s3: Bool;
}

contract Test {
  f1: S;
  f2: S;

  init() {
    self.f1 = S{ s1:1, s2:"x", s3:true };
    self.f2 = S{ s1:2, s2:"y", s3:false };
  }
}
