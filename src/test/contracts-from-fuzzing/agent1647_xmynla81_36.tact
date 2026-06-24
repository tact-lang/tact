struct Level3 {
  z: Int? = null;
}

struct Level2 {
  l3: Level3? = null;
}

struct Level1 {
  l2: Level2? = null;
}

contract Test {
  data: Level1;

  init() {
    self.data = Level1{};
  }
}
