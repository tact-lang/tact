// Many optionals in one struct
struct ManyOpts {
  x: Int?;
  y: Int?;
  z: Bool?;
  s: String?;
}

contract Test {
  opts: ManyOpts;

  init() {
    self.opts = ManyOpts{
      x: null,
      y: null,
      z: null,
      s: null
    };
  }
}