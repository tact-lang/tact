struct Opts {
  a: Int?;
  b: Bool?;
  s: String?;
}

contract ComplexOptionals {
  x: Opts;
  y: Opts?;

  init() {
    self.x = Opts{a: null, b:null, s:null};
    self.y = null;
  }
}