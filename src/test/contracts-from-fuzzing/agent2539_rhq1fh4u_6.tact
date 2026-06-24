struct Level2 {
  val: Int;
}

struct Level1 {
  nested: Level2;
}

contract DeepOptional {
  nestedOpt: Level1?;

  init() {
    self.nestedOpt = Level1{nested: Level2{val: 101}};
  }
}