struct OptionalNest {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract OptFields {
  persist: OptionalNest;

  init() {
    self.persist = OptionalNest{x: null, y: true, z: null};
  }
}