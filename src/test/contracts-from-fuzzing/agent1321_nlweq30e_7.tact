struct Inner {
  x: Int;
}

struct Mid {
  val: Inner?;
}

struct Outer {
  mid: Mid?;
}

contract Test {
  outer: Outer;

  init() {
    self.outer = Outer{ mid: Mid{ val: Inner{ x: 123 } } };
  }
}
