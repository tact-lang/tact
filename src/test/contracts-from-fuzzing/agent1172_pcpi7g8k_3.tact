struct DeepOptionals {
  x: Int?;
  y: Bool?;
  z: String?;
  nested: NestedOptional;
}

struct NestedOptional {
  ni: Int?;
  nb: Bool?;
}

contract OptionalsTest {
  data: DeepOptionals;

  init() {
    self.data = DeepOptionals{
      x: null,
      y: true,
      z: "hello",
      nested: NestedOptional{ ni: 42, nb: null }
    };
  }
}