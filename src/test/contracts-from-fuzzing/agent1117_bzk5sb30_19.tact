struct OptionalStr {
  s: String?;
}

struct OptionalNested {
  inner: OptionalStr?;
}

contract OptOptTest {
  field: OptionalNested;

  init() {
    self.field = OptionalNested{
      inner: OptionalStr{ s: "hi" }
    };
  }
}
