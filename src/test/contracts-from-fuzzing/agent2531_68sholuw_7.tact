struct OptionalDeep {
  level1: Level1?;
}

struct Level1 {
  level2: Level2?;
}

struct Level2 {
  val: Int;
}

contract OptionalDeepTest {
  deep: OptionalDeep;

  init() {
    self.deep = OptionalDeep{
      level1: Level1{
        level2: Level2{ val: 123 }
      }
    };
  }
}
