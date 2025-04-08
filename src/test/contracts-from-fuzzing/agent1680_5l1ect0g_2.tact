struct NestedLevel2 {
  val1: Int;
  val2: Bool;
}

struct NestedLevel1 {
  inner: NestedLevel2;
}

contract TestContract {
  field: NestedLevel1;

  init() {
    self.field = NestedLevel1{inner: NestedLevel2{val1: 5, val2: false}};
  }
}
