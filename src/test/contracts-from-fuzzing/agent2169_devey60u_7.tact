struct Level3 {
  s: String;
}

struct Level2 {
  level3: Level3;
}

struct Level1 {
  level2: Level2;
}

contract OptionalDeepNested {
  nested: Level1?;

  init() {
    self.nested = null;
  }
}