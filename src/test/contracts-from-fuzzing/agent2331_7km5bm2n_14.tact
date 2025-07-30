struct S {
  a: Int = 1;
  b: Bool = true;
  c: String = "x";
}

contract Test {
  s: S;
  init() {
    self.s = S{};
  }
}