struct S {
  a: Int = 1;
  b: Bool = false;
  s: String = "s";
}

contract Test {
    s: S;
    init() { self.s = S{}; }
}
