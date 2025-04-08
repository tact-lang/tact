struct S {
  x: Int = 0;
  y: Bool = false;
  z: String = "";
}

contract DefaultValues {
  s: S;

  init() {
    self.s = S{};
  }
}