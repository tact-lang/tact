struct Deep {
  x: Int?;
  y: Int;
}

struct Mid {
  d: Deep;
  s: String?;
}

contract MultiLayerOpt {
  mid: Mid?;

  init() {
    self.mid = null;
  }
}