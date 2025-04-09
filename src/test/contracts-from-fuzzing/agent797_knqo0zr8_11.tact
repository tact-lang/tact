struct EdgeDefaults {
  x: Int?;
  y: Int = 5;
  z: Bool?;
}

contract DefaultVsOptional {
  f: EdgeDefaults;

  init() {
    self.f = EdgeDefaults{};
  }
}
