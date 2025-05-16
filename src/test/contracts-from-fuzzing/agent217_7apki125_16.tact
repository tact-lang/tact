struct NestedOptStruct {
  foo: Int?;
  bar: Bool;
}

contract OptStructField {
  maybeStruct: NestedOptStruct?;

  init() {
    self.maybeStruct = null;
  }
}