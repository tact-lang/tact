struct Defaults {
  a: Int = 1;
  b: Bool = false;
}

contract PartDefaults {
  foo: Int;
  bar: Bool;
  s: Defaults;

  init() {
    self.foo = 8;
    self.bar = true;
    self.s = Defaults{};
  }
}