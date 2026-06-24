struct Level3 {
  leaf: Bool;
}

struct Level2 {
  node: Level3;
}

struct Level1 {
  branch: Level2;
}

contract DeepNest {
  tree: Level1;
  init() {
    self.tree = Level1{ branch: Level2{ node: Level3{leaf:true} } };
  }
}
