struct OptionalNested {
  value: Int?;
  text: String?;
  deeper: InnerOpt?;
}

struct InnerOpt {
  foo: Bool;
}

contract OptNestTest {
  data: OptionalNested;

  init() {
    self.data = OptionalNested{
      value: null,
      text: null,
      deeper: InnerOpt{ foo: true }
    };
  }
}