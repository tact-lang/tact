struct Inner {
  a: Int = 1;
  b: Bool = true;
}

contract Test {
  x: Int = 10;
  y: Inner = Inner{};
  z: String = "hello";

  init() {
    self.x = 42;
    self.y = Inner{ a: 5, b: false };
    self.z = "world";
  }
}