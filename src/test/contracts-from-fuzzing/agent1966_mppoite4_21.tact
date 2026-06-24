struct Defaults {
  a: Int = 42;
  b: Bool = false;
  c: String = "abc";
  d: Int? = null;
}

contract DefaultsNestedWithOpt {
  f: Defaults;

  init() {
    self.f = Defaults{};
  }
}
