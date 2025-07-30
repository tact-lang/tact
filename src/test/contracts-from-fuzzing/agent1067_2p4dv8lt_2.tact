struct Nested1 {
  a: Int;
  b: Bool;
}

struct Nested2 {
  inner: Nested1;
  flag: Bool = false;
}

contract TestNestedOptional {
  optStruct: Nested2?;

  init() {
    self.optStruct = null;
  }
}