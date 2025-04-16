struct ManyOptionals {
  x: Int?;
  y: Bool?;
  z: Address?;
  s: String?;
}

contract LotsOfOptionals {
  opt: ManyOptionals;

  init() {
    self.opt = ManyOptionals{
      x: null,
      y: null,
      z: null,
      s: null
    };
  }
}