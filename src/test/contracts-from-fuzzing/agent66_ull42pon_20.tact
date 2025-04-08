// Struct chain containing optional nested inside optional nested inside struct
struct Inner {
  foo: Int?;
}

struct Outer {
  inner: Inner?;
}

contract Weird {
  outer: Outer;

  init() {
    self.outer = Outer{ inner: null };
  }
}