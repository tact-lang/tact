struct OptionalContainer {
  nested: Inner?;
}

struct Inner {
  x: Int;
  y: Bool;
}

contract TestContract {
  val: OptionalContainer;

  init() {
    self.val = OptionalContainer{ nested: null };
  }
}