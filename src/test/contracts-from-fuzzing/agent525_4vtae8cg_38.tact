struct S {
  f: Int;
}

contract DupFields {
  s1: S;
  s2: S;

  init() {
    self.s1 = S{f:1};
    self.s2 = S{f:2};
  }
}