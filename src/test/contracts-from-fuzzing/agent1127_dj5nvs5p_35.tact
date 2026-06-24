struct S {
  a: Int = 1;
  b: Bool = true;
  s: String = "s";
  opt: Int? = null;
}

contract TestDefaults {
  data: S;

  init() {
    self.data = S{};
  }
}
