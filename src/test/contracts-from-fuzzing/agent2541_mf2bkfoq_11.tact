struct Level4 { v: Int }
struct Level3 { l4: Level4 }
struct Level2 { l3: Level3 }
struct Level1 { l2: Level2 }

contract DeepTree {
  root: Level1;

  init() {
    self.root = Level1{ l2: Level2{ l3: Level3{ l4: Level4{ v: 42 } } } };
  }
}