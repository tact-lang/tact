struct Level3 {
  c: String;
}

struct Level2 {
  b: Level3;
}

struct Level1 {
  a: Level2;
}

contract DeepNested {
  nested: Level1;

  init() {
    self.nested = Level1 {
      a: Level2 {
        b: Level3 {
          c: "deep"
        }
      }
    };
  }
}
