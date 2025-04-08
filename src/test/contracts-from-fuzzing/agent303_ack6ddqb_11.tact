struct DeepOpt {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract Opts {
  nested: DeepOpt;
  init() {
    self.nested = DeepOpt{ x: null, y: true, z: null };
  }
}