struct Low {
  x: Int?;
  y: Int?;
}

struct Mid {
  low: Low?;
  z: Int;
}

struct Top {
  mid: Mid?;
  w: Int;
}

contract TestContract {
  nest: Top;

  init() {
    self.nest = Top{
      mid: null,
      w: 77
    };
  }
}