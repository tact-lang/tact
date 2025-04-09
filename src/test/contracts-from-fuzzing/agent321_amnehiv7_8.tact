struct SInner {
  a: Int = 5;
  b: Bool = true;
}

contract DefaultsNested {
  inner: SInner;

  init() {
    self.inner = SInner{};
  }
}