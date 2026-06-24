struct NestedWithDefaults {
  f: Bool = false;
  val: Int = 3;
}

contract OptionalNestedWithDefaults {
  data: NestedWithDefaults?;

  init() {
    self.data = null;
  }
}