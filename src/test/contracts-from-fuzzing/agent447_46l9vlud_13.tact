struct OptNested2 {
  value: Int;
}

struct OptNested1 {
  nested: OptNested2?;
}

contract TestOptNested {
  inner: OptNested1?;

  init() {
    self.inner = null;
  }
}