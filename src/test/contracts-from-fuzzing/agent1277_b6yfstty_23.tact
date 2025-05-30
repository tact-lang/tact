struct Defaults {
  foo: Int = 42;
  bar: Bool = false;
  baz: String = "ok";
}

contract TestContract {
  d: Defaults;
  init() {
    self.d = Defaults{};
  }
}