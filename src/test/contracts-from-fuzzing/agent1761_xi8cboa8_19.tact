struct MixedNesting {
  inner1: NestedIntBool;
  inner2: NestedIntBoolOpt;
}

struct NestedIntBool {
  a: Int;
  b: Bool;
}

struct NestedIntBoolOpt {
  a: Int?;
  b: Bool;
}

contract MixedNestingTest {
  s: MixedNesting;

  init() {
    self.s = MixedNesting{
      inner1: NestedIntBool{
        a: 1,
        b: true
      },
      inner2: NestedIntBoolOpt{
        a: null,
        b: false
      }
    };
  }
}