struct S {
  a: Int;
}

contract Arranged {
  s1: S;
  s2: S;
  s3: S;
  s4: S;

  init() {
    self.s1 = S{a:1};
    self.s2 = S{a:2};
    self.s3 = S{a:3};
    self.s4 = S{a:4};
  }
}