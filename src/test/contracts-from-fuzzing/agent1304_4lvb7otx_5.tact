struct Level4 { val: Int; }
struct Level3 { l4: Level4; }
struct Level2 { l3: Level3; }
struct Level1 { l2: Level2; }

contract DeepChain {
  data: Level1;

  init() {
    self.data = Level1{ l2: Level2{ l3: Level3{ l4: Level4{ val: 42 } } } };
  }
}