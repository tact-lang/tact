struct Level2 {
  val2: Int;
  flag2: Bool;
}

struct Level1 {
  nested2: Level2;
  opt2: Bool?;
}

contract DeepNested {
  nested1: Level1;

  init() {
    self.nested1 = Level1{ nested2: Level2{ val2: 2, flag2: false }, opt2: null };
  }
}
