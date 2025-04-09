// test nested structs with options at multiple levels
struct LevelThree {
  foo: Int?;
}

struct LevelTwo {
  bar: LevelThree?;
}

struct LevelOne {
  baz: LevelTwo?;
}

contract NestedOpts {
  val: LevelOne;

  init() {
    self.val = LevelOne{ baz: LevelTwo{ bar: LevelThree{ foo: null } } };
  }
}
