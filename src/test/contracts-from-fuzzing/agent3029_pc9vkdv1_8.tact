struct Level3 {
  val3: Int;
}

struct Level2 {
  val2: Level3;
}

struct Level1 {
  val1: Level2;
}

contract OptionalDeepNest {
    field1: Level1?;

    init() {
        self.field1 = null;
    }
}