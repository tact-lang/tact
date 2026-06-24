struct HasDefaults {
  foo: Int = 5;
  bar: Bool? = null;
}

struct Nested {
  x: Int;
}

contract MixedState {
  a: Int;
  b: Int?;
  c: Bool = true;
  d: HasDefaults;
  e: Nested;

  init() {
    self.a = 1;
    self.b = null;
    self.d = HasDefaults{};
    self.e = Nested{ x: 77 };
  }
}
