struct DeeplyNestedOpt {
  foo: Level1?;
}

struct Level1 {
  bar: Level2?;
}

struct Level2 {
  baz: Level3?;
}

struct Level3 {
  z: Int?;
}

contract TestDeepOpts {
  x: DeeplyNestedOpt;
  init() {
    self.x = DeeplyNestedOpt{ foo: null };
  }
}
