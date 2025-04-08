struct Level3 {
  value: Int;
}

struct Level2 {
  optional3: Level3?;
}

struct Level1 {
  nested2: Level2;
}

contract OptionalDeepNest {
  s: Level1;

  init() {
    self.s = Level1 {
      nested2: Level2 {
        optional3: null,
      }
    };
  }
}
