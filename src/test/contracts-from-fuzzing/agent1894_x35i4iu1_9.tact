struct Level3 {
  val: String;
}

struct Level2 {
  l3: Level3;
}

struct Level1 {
  l2: Level2;
}

contract DeepNested {
  l1: Level1;

  init() {
    self.l1 = Level1{ l2: Level2{ l3: Level3{ val:"deep" } } };
  }
}