struct S {
  a: Int;
  b: Int;
  c: Int;
}

contract Test {
  s1: S;
  s2: S;
  s3: S;

  init() {
    self.s1 = S{a:1,b:2,c:3};
    self.s2 = S{a:4,b:5,c:6};
    self.s3 = S{a:7,b:8,c:9};
  }
}
