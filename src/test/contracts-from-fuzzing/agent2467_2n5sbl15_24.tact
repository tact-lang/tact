struct Inner { a: Int; }
struct Outer { i: Inner; }

contract NestedNullable {
  x: Outer?;
  init() {
    self.x = null;
  }
}