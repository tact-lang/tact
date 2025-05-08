struct OptionalDeep {
  nestedA: LevelA?;
}

struct LevelA {
  nestedB: LevelB?;
}

struct LevelB {
  x: Int?;
  y: Bool;
}

contract DeepOptionalChain {
    data: OptionalDeep;
    init() {
      self.data = OptionalDeep{ nestedA: null };
    }
}