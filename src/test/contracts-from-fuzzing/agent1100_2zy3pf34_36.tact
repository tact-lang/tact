struct NestedNulls {
  a: Int?;
  b: Bool;
}

contract DeepNullInits {
  f: NestedNulls?;

  init() {
    self.f = null;
  }
}
