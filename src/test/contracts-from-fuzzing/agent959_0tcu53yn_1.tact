struct Nested {
  inner: InnerStruct;
}

struct InnerStruct {
  x: Int;
  y: Int?;
}

contract Test {
  val: Nested;
  init() {
    self.val = Nested{inner: InnerStruct{x: 1, y: 2}};
  }
}
