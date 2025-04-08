// Test multiple levels of optional contract fields
struct Inner {
  x: Int;
}

struct Outer {
  maybe: Inner?;
}

contract MultiOptFields {
  outerOpt: Outer?;

  init() {
    self.outerOpt = Outer{ maybe: Inner{ x: 42 } };
  }
}