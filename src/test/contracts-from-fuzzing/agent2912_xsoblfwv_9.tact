struct Inner {
  f: Int;
}

struct Outer {
  s: Inner?;
}

contract OptionalNested {
  val: Outer;
  init() {
    self.val = Outer{ s: null };
  }
}