struct OptionalDeep {
  val: Int?;
}

struct DeepNestOpt {
  level1: OptionalDeep;
  level2: OptionalDeep?;
  level3: OptionalDeep;
}

contract OptDeepContract {
  s: DeepNestOpt;

  init() {
    self.s = DeepNestOpt{
      level1: OptionalDeep{val:1},
      level2: null,
      level3: OptionalDeep{val:3},
    };
  }
}