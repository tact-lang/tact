struct MultipleOptionals {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract Test {
  optStruct: MultipleOptionals;

  init() {
    self.optStruct = MultipleOptionals{
      x: null,
      y: true,
      z: null
    };
  }
}