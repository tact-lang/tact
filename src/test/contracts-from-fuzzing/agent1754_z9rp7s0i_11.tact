struct NestedOptionals {
  foo: Int?;
  inner: InnerOpt?;
}

struct InnerOpt {
  bar: Int?;
  deep: DeepOpt?;
}

struct DeepOpt {
  val: Bool?;
}

contract NestedOptTest {
  val: NestedOptionals;
  init() {
    self.val = NestedOptionals{
      foo: null,
      inner: null
    };
  }
}