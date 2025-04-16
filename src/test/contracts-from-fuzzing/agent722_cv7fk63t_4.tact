struct Level3 {
  deep: Int;
}

struct Level2 {
  nested: Level3;
}

struct Level1 {
  inner: Level2;
}

contract ThreeLevelNested {
  s: Level1;
  init() {
    self.s = Level1{
      inner: Level2{
        nested: Level3{deep:42}
      }
    };
  }
}