struct OptionalDeep {
  level1: Int?;
  level2: Int?;
  level3: Int?;
  level4: Int?;
}

contract OptLevels {
  data: OptionalDeep;

  init() {
    self.data = OptionalDeep{
      level1: null, level2: 2, level3: null, level4: 4
    };
  }
}