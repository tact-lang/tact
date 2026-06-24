struct Inner {
  val: Int;
}

struct Outer {
  nested: Inner;
}

contract DeepNestedTest {
  field: Outer;

  init() {
    self.field = Outer{
      nested: Inner{
        val: 5,
      },
    };
  }
}