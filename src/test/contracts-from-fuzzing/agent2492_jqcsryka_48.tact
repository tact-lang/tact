struct S {
  x: Int? = null;
  y: Bool = false;
}
contract StructDefaultsOpt {
  s: S;
  init() {
    self.s = S{};
  }
}