struct NestedOptional {
  a: Int?;
  b: Int?;
}

struct WithOptionals {
  x: Int?;
  nest: NestedOptional;
}

contract OptTest {
  field: WithOptionals;

  init() {
    self.field = WithOptionals{
      x: null,
      nest: NestedOptional{
        a: null,
        b: 42
      }
    };
  }
}