struct ZeroDefaults {
  x: Int = 0;
  y: Int?;
  z: String = "";
}

contract TestContract {
  data: ZeroDefaults;

  init() {
    self.data = ZeroDefaults{};
  }
}