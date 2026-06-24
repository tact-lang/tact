struct DeeplyNestedOptional {
  level1: Level1Option?;
}

struct Level1Option {
  level2: Level2Option?;
}

struct Level2Option {
  value: Int?;
}

contract TestDeeplyNestedOption {
  data: DeeplyNestedOptional;

  init() {
    self.data = DeeplyNestedOptional{ level1: null };
  }
}