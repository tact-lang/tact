struct MultiLayer {
  level1: Bool;
  level2: Int;
  level3: String;
  level4: Int?;
}

contract MixedType {
  val: MultiLayer;

  init() {
    self.val = MultiLayer{
      level1: true,
      level2: 123,
      level3: "hi",
      level4: null
    };
  }
}