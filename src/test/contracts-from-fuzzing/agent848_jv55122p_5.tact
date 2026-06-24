struct Level3 {
  deepValue: Int;
}

struct Level2 {
  nestedOpt: Level3?;
}

struct Level1 {
  nested: Level2;
}

contract NestedOptionalTest {
  data: Level1;

  init() {
    self.data = Level1{ nested: Level2{ nestedOpt: null } };
  }
}