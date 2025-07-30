struct Level3 { d: Int; }
struct Level2 { c: Level3; }
struct Level1 { b: Level2; }

contract DeepChain {
  nested: Level1;

  init() {
    self.nested = Level1{ b: Level2{ c: Level3{ d: 777 } } };
  }
}