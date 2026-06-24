struct MixedDefaults {
  x: Int = 1;
  y: Int;
}

contract MixedDefaultsDemo {
  foo: MixedDefaults;

  init() {
    self.foo = MixedDefaults {
      y: 5,
    };
  }

  receive() {
    let _ = self.foo.y;
  }
}
