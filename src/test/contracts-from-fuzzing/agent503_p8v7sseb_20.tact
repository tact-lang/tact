struct PartOpt {
  x: Int?;
  y: Bool?;
}

contract PartNull {
  s: PartOpt;

  init() {
    self.s = PartOpt{ y: true };
  }
}
