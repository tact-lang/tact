struct Level3 { val3: Int; }
struct Level2 { nested3: Level3; val2: Int; }
struct Level1 { nested2: Level2; val1: Int; }
contract DeepNest {
  data: Level1;

  init() {
    self.data = Level1{
      nested2: Level2{
        nested3: Level3{ val3: 33 },
        val2: 22,
      },
      val1: 11,
    };
  }
}