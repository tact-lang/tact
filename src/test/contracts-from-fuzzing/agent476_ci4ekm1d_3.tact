struct Inner {
  bar: Int;
}

contract ManyOptionals {
  a: Int?;
  b: Int?;
  c: Bool?;
  d: Inner?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
    self.d = null;
  }

  receive() {
    if (self.d != null) {
      let _ = self.d!!;
    }
  }
}