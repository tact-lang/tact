struct DeeplyNested {
  l1: Level1;
}

struct Level1 {
  l2: Level2;
}

struct Level2 {
  l3: Level3;
}

struct Level3 {
  val: Int;
  flag: Bool;
}

contract DeepNestTest {
  storage: DeeplyNested;
  init() {
    self.storage = DeeplyNested{
      l1: Level1{
        l2: Level2{
          l3: Level3{
            val: 42,
            flag: true,
          }
        }
      }
    };
  }
}
