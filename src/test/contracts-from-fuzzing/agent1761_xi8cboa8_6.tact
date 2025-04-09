struct NestedOptionsAndBools {
  a: Int?;
  b: Bool;
  c: Int?;
  d: Bool;
  e: Int?;
}

contract MixOptBool {
  storage: NestedOptionsAndBools;

  init() {
    self.storage = NestedOptionsAndBools{
      a: null,
      b: true,
      c: null,
      d: false,
      e: null
    };
  }
}