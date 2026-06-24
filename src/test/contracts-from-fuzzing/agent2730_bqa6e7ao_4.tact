struct OptionalStruct {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract TestOptStruct {
  opt: OptionalStruct;

  init() {
    self.opt = OptionalStruct{ x: null, y: null, z: null };
  }
}