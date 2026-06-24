struct Inner {
  foo: Int = 42;
}

contract Defaults {
  n: Int = 1;
  b: Bool = false;
  s: String = "hi";
  inner: Inner = Inner{};

  init() {
    self.n = 10;
    self.b = true;
    self.s = "updated";
    self.inner = Inner{ foo: 100 };
  }
}