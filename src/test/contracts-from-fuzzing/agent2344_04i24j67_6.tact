struct Defaults {
  x: Int = 7;
  y: Bool = false;
  z: Int?;
}

contract DefaultValues {
  s: Defaults;

  init() {
    self.s = Defaults{};
  }
}