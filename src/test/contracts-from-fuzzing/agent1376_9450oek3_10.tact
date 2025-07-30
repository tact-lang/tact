struct DefaultVals {
  x: Int = 5;
  y: String = "default";
  z: Bool?;
}

contract DefaultInit {
  data: DefaultVals;

  init() {
    self.data = DefaultVals{};
  }
}
