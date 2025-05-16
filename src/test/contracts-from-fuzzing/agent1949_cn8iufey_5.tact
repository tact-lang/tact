struct DeeplyNested {
  x: Int;
  level2: Level2;
}

struct Level2 {
  y: Int;
  level3: Level3;
}

struct Level3 {
  z: Int;
  s: String?;
}

contract DeepNestTest {
  val: DeeplyNested;

  init() {
    self.val = DeeplyNested{
      x: 1,
      level2: Level2{
        y: 2,
        level3: Level3{
          z: 3,
          s: null
        }
      }
    };
  }
}
