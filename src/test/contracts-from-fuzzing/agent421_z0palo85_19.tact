struct Level3 {
  c: Int;
}

struct Level2 {
  b: Level3;
}

struct Level1 {
  a: Level2;
}

contract OptionalInnerStruct {
  foo: Level1?;
  init() {
    self.foo = null;
  }
}