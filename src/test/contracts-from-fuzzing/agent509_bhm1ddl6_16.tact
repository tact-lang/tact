struct NestedOptLevel2 {
  value: Int?;
}

struct NestedOptLevel1 {
  inner: NestedOptLevel2?;
}

contract NestedOptionals {
  field: NestedOptLevel1?;

  init() {
    self.field = null;
  }
}