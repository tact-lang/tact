struct OptionalNested {
  nestedOpt: Inner?;
}

struct Inner {
  x: Int;
  y: Bool;
}

contract OptionalNestedTest {
  val: OptionalNested;

  init() {
    self.val = OptionalNested{
      nestedOpt: Inner{
        x: 10,
        y: false
      }
    };
  }
}
