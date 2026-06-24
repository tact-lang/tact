struct Level3 { a: Int; opt: Bool?; }
struct Level2 { l3: Level3; }
struct Level1 { l2: Level2; }

contract DeepHier {
  nested: Level1;

  init() {
    self.nested = Level1{ l2: Level2{ l3: Level3{ a: 42, opt:null } } };
  }
}