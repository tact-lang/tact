struct NestedOptionals {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract Test {
  data: NestedOptionals;

  init() {
    self.data = NestedOptionals{
      x: null,
      y: true,
      z: "hello",
    };
  }
}