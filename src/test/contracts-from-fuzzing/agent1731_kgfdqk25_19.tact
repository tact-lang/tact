struct Boo {
  a: Int;
  b: Bool;
}

contract InitDefaults {
  b: Boo = Boo{ a: 123, b: true };

  init() {
    self.b = Boo{ a: 42, b: false };
  }
}
