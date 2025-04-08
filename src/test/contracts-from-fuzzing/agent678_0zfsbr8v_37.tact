struct S {
  a: Int as uint3;
  b: Int? = -1;
}

contract BadDefault {
  s: S;

  init() {
    self.s = S{a:8, b:-1};
  }
}