struct DefaultVals {
  x: Int = 1;
  y: Bool = true;
  z: String = "hello";
}

contract DefaultInStruct {
  s: DefaultVals;

  init() {
    self.s = DefaultVals{};
  }
}
