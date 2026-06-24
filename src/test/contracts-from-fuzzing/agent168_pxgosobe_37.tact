struct InnerDefault {
  x: Int = 7;
  y: Bool = true;
}

contract StructWithDefaults {
  f: InnerDefault;

  init() {
    self.f = InnerDefault{};
  }
}