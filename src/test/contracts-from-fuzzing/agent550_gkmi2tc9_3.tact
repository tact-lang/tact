struct OptionalNested {
  optLevel1: Level1?;
}

struct Level1 {
  optLevel2: Level2?;
}

struct Level2 {
  optVal: Int?;
}

contract Test {
  nested: OptionalNested;
  init() {
    self.nested = OptionalNested{
      optLevel1: Level1{
        optLevel2: Level2{
          optVal: null
        }
      }
    };
  }
}