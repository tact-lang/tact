contract StructFieldDefaults {
  a: Inner;

  init() {
    self.a = Inner{ x: 1, y: true };
  }
}

struct Inner {
  x: Int;
  y: Bool = false;
}