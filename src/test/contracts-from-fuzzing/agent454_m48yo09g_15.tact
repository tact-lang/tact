struct Inner {
  a: Int;
  b: Bool;
}

struct OuterWithDefaults {
  s: Inner = Inner{ a: 7, b: false };
  x: Int = 42;
  y: Bool = true;
}

contract TestContract {
  data: OuterWithDefaults;
  init() {
    self.data = OuterWithDefaults{};
  }
}