struct Leaf {
  x: Int = 11;
  y: Bool?;
}

struct Branch {
  leaf: Leaf;
  zz: Int? = null;
}

struct Mid {
  branch: Branch?;
}

struct Top {
  mid: Mid?;
}

contract Test {
  t: Top;

  init() {
    self.t = Top{ mid: null };
  }
}