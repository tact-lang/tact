struct DefaultsInner {
  a: Int = 5;
  b: Bool = true;
}

contract NestedDefaultsFlat {
  d: DefaultsInner;

  init() {
    self.d = DefaultsInner{};
  }
}