// Deeply nested null defaults for optional chains
struct Leaf {
  z: Int?;
}

struct Mid {
  leaf: Leaf?;
}

struct Top {
  mid: Mid?;
}

contract DeepNulls {
  data: Top;

  init() {
    self.data = Top{ mid: null };
  }
}
