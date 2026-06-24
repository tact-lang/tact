struct WrapDefault {
  x: Int = 5;
  y: Bool = true;
}

contract DefaultsInStruct {
  w: WrapDefault;

  init() {
    self.w = WrapDefault{};
  }
}