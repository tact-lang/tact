struct Opts {
    x: Int?;
    y: Int?;
    z: Int?;
}

contract OnlyStructOptionals {
  s: Opts?;

  init() {
    self.s = null;
  }
}