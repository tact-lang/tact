struct DeepOpt {
  nestedOpt: Level1?;
}

struct Level1 {
  nested: Level2;
}

struct Level2 {
  val: Int;
}

contract DeepOptional {
  deep: DeepOpt;

  init() {
    self.deep = DeepOpt{ nestedOpt: null };
  }
}