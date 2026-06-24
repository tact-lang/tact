struct Inner {
  flag: Bool;
  count: Int;
}

contract DeepNestedOptionals {
  data: Inner?;

  init() {
    self.data = null;
  }
}