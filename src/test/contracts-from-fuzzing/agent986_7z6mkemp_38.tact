struct Inner {
  flag: Bool;
}

contract OptionalInner {
  v: Inner?;
  init() { self.v = null; }
}
