struct S {
  a: Int;
  b: Bool;
}

contract ArrayLike {
  f0: S;
  f1: S;
  f2: S;
  f3: S;

  init() {
    self.f0 = S{a:1,b:true};
    self.f1 = S{a:2,b:false};
    self.f2 = S{a:3,b:true};
    self.f3 = S{a:4,b:false};
  }
}
