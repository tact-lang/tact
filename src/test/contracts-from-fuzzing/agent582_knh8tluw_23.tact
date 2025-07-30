struct NestedOpt {
  deep: Level2?;
}

struct Level2 {
  name: String;
  inside: InnerMost?;
}

struct InnerMost {
  id: Int;
}

contract OptionalDeepChain {
  s: NestedOpt;

  init() {
    self.s = NestedOpt{
      deep: Level2{
        name: "test",
        inside: InnerMost{ id: 5 }
      }
    };
  }
}
