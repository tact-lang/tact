struct ManyNestedOptionals {
  one: Int?;
  two: Bool?;
  three: String?;
}

struct DeepContainer {
  inner: ManyNestedOptionals?;
}

contract ManyNestedOptionalsTest {
  val: DeepContainer;

  init() {
    self.val = DeepContainer{
      inner: null
    };
  }
}