struct Defaults {
  foo: Int = 1;
  bar: Bool = false;
}

contract DefaultsOverride {
  s: Defaults;

  init() {
    self.s = Defaults{ foo: 42, bar: true };
  }
}