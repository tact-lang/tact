struct Inner {
  a: Int;
  b: Bool;
  c: Bool?;
  d: String;
}

contract OptNested {
  data: Inner?;

  init() {
    self.data = null;
  }
}