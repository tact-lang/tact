struct Inner {
  a: Int;
  b: Bool;
}

contract Test {
  x: Int;
  y: Bool;
  inner: Inner;
  
  init() {
    self.x = 1;
    self.y = true;
    self.inner = Inner{ a: 5, b: false };
  }
}