struct NestedOptionalDeep {
  level2: Level2?;
}

struct Level2 {
  level3: Level3?;
}

struct Level3 {
  foo: Int?;
}

contract NestedOptionalsDeepStorage {
  data: NestedOptionalDeep;

  init() {
    self.data = NestedOptionalDeep{level2: null};
  }
}