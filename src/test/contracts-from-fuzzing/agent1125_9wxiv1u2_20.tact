struct Defaults {
  x: Int = 1;
  y: Bool = false;
  str: String = "hello";
}

contract DefaultVals {
  dat: Defaults;
  init() {
    self.dat = Defaults{};
  }
}