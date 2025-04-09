struct HasDefaults {
  x: Int = 2;
  y: Bool = true;
  z: String = "default";
}

contract StructDefaultTest {
  val: HasDefaults;

  init() {
    self.val = HasDefaults{};
  }
}
