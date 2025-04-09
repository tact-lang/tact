struct Deep {
  level2: Level2;
}

struct Level2 {
  level3: Level3;
}

struct Level3 {
  val: Int;
  text: String;
}

contract CC {
  d: Deep;

  init() {
    self.d = Deep{
      level2: Level2{
        level3: Level3{
          val: 123,
          text: "test"
        }
      }
    };
  }
}
