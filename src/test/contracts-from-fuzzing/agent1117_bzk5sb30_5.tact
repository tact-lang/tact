struct Nested {
  x: Int;
  y: Int?;
}

contract DeepInits {
  data1: Nested = Nested{ x: 1, y: null };
  data2: Nested? = null;

  init() {
    self.data1 = Nested{ x: 3, y: 4 };
    self.data2 = Nested{ x: 5, y: null };
  }
}
