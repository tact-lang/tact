struct DeeplyNested {
  level1: Level1;
}

struct Level1 {
  level2: Level2;
  optionalField: Bool?;
}

struct Level2 {
  level3: Level3;
}

struct Level3 {
  someValue: Int;
  anotherOptional: String?;
}

contract TestContract {
  nestedData: DeeplyNested;

  init() {
    self.nestedData = DeeplyNested{
      level1: Level1{
        level2: Level2{
          level3: Level3{
            someValue: 42,
            anotherOptional: null
          }
        },
        optionalField: true
      }
    };
  }
}