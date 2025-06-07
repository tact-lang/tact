struct OptIntBool {
  x: Int?;
  y: Bool?;
}

contract OptionalStructPersistent {
  data: OptIntBool?;

  init() {
    self.data = OptIntBool{ x: null, y: true };
  }
}