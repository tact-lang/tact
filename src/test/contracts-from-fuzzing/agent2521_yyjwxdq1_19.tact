struct Leaf { v: Int }

struct Mid {
  leaf: Leaf?;
}

struct Root {
  mid: Mid?;
}

contract OptLayers {
  r: Root?;

  init() {
    self.r = Root{ mid: Mid{ leaf: Leaf{ v: 99 } } };
  }
}
