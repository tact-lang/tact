struct Inn {
  i: Int;
}

struct Mid {
  x: Inn;
}

struct Outer {
  m: Mid;
}

contract DeepOuter {
  val: Outer;

  init() {
    self.val = Outer{ m: Mid{ x: Inn{ i:123 } } };
  }
}