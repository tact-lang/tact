struct Defaulted {
  x: Int = 10;
  y: Bool = true;
  z: String = "hi";
}

contract DefaultVals {
  data: Defaulted;

  init() {
    self.data = Defaulted{};
  }
}