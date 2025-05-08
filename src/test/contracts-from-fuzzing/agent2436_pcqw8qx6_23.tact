struct OptNested {
  nested: Inner?;
}

struct Inner {
  value: Int;
}

contract OptNestTest {
  val: OptNested;

  init() {
    self.val = OptNested{nested: null};
  }
}