struct MultiDefaults {
  x: Int = 1;
  y: Bool = false;
  z: String = "ok";
}

contract SDManyDefaults {
  val: MultiDefaults;

  init() {
    self.val = MultiDefaults{};
  }
}