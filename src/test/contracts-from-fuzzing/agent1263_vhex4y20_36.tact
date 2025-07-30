struct Leaf {
  a: Int = 1;
  b: Int;
}

struct Mid {
  child: Leaf;
}

struct Outer {
  mid: Mid = Mid { child: Leaf { b: 5 } };
}

contract Test {
  val: Outer;

  init() {
    self.val = Outer{};
  }
}