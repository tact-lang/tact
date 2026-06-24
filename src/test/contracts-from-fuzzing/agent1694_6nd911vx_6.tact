struct Level3 { n: Int?; }
struct Level2 { l3: Level3; }
struct Level1 { l2: Level2; }

contract DeepNest {
  value: Level1;

  init() {
    self.value = Level1{ l2: Level2{ l3: Level3{n: null} } };
  }
}