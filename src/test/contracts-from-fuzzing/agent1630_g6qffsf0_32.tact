struct Level3 { b: Bool; }
struct Level2 { l3: Level3; }
struct Level1 { l2: Level2; }

contract DeepStructChain {
  nested: Level1;

  init() {
    self.nested = Level1 { l2: Level2 { l3: Level3 { b: true } } };
  }
}