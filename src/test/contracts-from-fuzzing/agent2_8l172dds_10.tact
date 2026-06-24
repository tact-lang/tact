// Simulate a large struct chain with default values
struct LevelA {
  prop: Int = 1;
}

struct LevelB {
  levelA: LevelA = LevelA{};
}

struct LevelC {
  levelB: LevelB = LevelB{};
}

contract Test {
  root: LevelC;

  init() {
    self.root = LevelC{};
  }
}