struct IntStringMix {
  x: Int;
  s: String;
}

contract NestedDefaults {
  data: IntStringMix;

  init() {
    self.data = IntStringMix{
      x: 123,
      s: "hello",
    };
  }
}