struct SubOpt {
  x: Int?;
  y: Bool?;
}

contract NullableStructs {
  s: SubOpt?;

  init() {
    self.s = null;
  }
}