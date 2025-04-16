struct Inner { a: Int }
struct Outer { nested: Inner? }

contract OptNestedDefault {
  s: Outer = Outer{ nested: null };

  init() {
    self.s = Outer{ nested: null };
  }
}