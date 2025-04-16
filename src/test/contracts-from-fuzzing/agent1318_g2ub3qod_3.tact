struct Opts {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract Test {
  opts: Opts;

  init() {
    self.opts = Opts{x: null, y: true, z: null};
  }
}