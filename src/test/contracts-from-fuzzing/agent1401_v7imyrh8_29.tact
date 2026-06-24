struct SDefault {
  x: Int;
  y: Bool = true;
}

contract DefaultInnerStruct {
  v: SDefault;

  init() {
    self.v = SDefault{x: 1};
  }
}