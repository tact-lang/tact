struct Level1 {
  a: Int;
}

struct Level2 {
  l1: Level1;
}

struct Level3 {
  l2: Level2;
}

contract OptLayers {
  layer: Level3?;
  init() {
    self.layer = null;
  }
}