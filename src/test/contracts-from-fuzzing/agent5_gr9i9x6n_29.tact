struct HasDefaults {
  x: Int = 2;
  y: Int = 3;
}

contract TopDefaults {
  z: HasDefaults;

  init() {
    self.z = HasDefaults{};
  }

  receive() {
    let _ = self.z.y;
  }
}
