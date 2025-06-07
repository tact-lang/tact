struct Leaf {
  z: Int;
}

struct Mid {
  leaf: Leaf? = Leaf{ z: 99 };
}

struct Top {
  mid: Mid?;
}

contract Test {
  val: Top;

  init() {
    self.val = Top{ mid: null };
  }
}