struct OptionalEdge {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract NullableFields {
  opt: OptionalEdge;

  init() {
    self.opt = OptionalEdge{ x: null, y: null, z: null };
  }
}