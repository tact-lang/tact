struct Conf {
  a: Int = 7;
  b: Bool?;
  c: Int?;
}

contract Test {
  cfg: Conf;

  init() {
    self.cfg = Conf{
      b: true,
      c: null
    };
  }
}