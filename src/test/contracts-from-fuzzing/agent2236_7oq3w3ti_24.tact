struct BigNest {
  s1: String;
  optS: String?;
}

struct LevelA {
  foo: BigNest;
  b: Bool;
}

struct LevelB {
  la: LevelA;
  i: Int;
  optInner: BigNest?;
}

contract LargeDeep {
  root: LevelB;

  init() {
    self.root = LevelB{
      la: LevelA{
        foo: BigNest{ s1: "str", optS: null },
        b: false
      },
      i: 7,
      optInner: null
    };
  }
}