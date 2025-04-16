struct Level3 {
  v: Int;
}

struct Level2 {
  l3: Level3;
}

struct Level1 {
  l2: Level2;
}

contract DeepStruct {
  nested: Level1;

  init() {
    self.nested = Level1{
      l2: Level2{
        l3: Level3{
          v: 99
        }
      }
    };
  }
}
