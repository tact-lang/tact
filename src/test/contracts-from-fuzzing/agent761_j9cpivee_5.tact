struct Level3 { val: Int }
struct Level2 { nested: Level3? }
struct Level1 { nested: Level2? }

contract OptionChain {
  chained: Level1;

  init() {
    self.chained = Level1{ nested: Level2{ nested: null } };
  }
}