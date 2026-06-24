struct MultiDefaults {
  a: Int = 1;
  b: String = "x";
  c: Bool = false;
}
contract UseDefaults {
  f: MultiDefaults;

  init() {
    self.f = MultiDefaults{};
  }
}