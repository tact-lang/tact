struct NestedOptional {
  text: String?;
  number: Int?;
  boolean: Bool?;
}

contract NestedOptionalsTest {
  info: NestedOptional;

  init() {
    self.info = NestedOptional {
      text: "hello",
      number: 42,
      boolean: true
    };
  }
}
