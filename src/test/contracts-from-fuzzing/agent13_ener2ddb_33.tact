struct S {
 a: Int;
 b: String;
}

contract OptionalStructArrayLike {
  s1: S?;
  s2: S?;
  s3: S?;
  s4: S?;

  init() {
    self.s1 = S{a:1,b:"one"};
    self.s2 = null;
    self.s3 = S{a:3,b:"three"};
    self.s4 = null;
  }
}