struct OptInner {
  foo: Int;
}

struct S {
  ptr: OptInner?;
}

contract NullNestedTest {
  val: S;
  init() {
    self.val = S{ptr: null};
  }
}