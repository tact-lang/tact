struct InnerMost {
  z: Int;
}

struct Level2 {
  inner: InnerMost;
}

struct Level1 {
  mid: Level2;
}

contract DeeplyNested {
  root: Level1;

  init() {
    self.root = Level1{
      mid: Level2{
        inner: InnerMost{
          z: 777
        }
      }
    };
  }
}