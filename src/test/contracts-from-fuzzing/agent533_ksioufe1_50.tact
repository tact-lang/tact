struct LevelOne {
  x: Int;
}

struct LevelTwo {
  y: LevelOne?;
}

struct LevelThree {
  z: LevelTwo?;
}

contract TwoOptLayers {
  val: LevelThree?;

  init() {
    self.val = null;
  }
}