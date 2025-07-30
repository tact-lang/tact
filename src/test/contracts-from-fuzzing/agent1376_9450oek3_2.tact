struct Level3 {
  leaf: Int;
}

struct Level2 {
  mid: Level3;
  optLeaf: Int?;
}

struct Level1 {
  top: Level2;
}

contract DeepNested {
  persistent: Level1;

  init() {
    self.persistent = Level1{
      top: Level2{ mid: Level3{ leaf:10 }, optLeaf:null }
    };
  }
}
