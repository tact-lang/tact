struct DeeplyNested {
  level1: Int;
  level2: Level2;
}

struct Level2 {
  a: Int?;
  level3: Level3;
}

struct Level3 {
  b: Bool;
  s: Level4;
}

struct Level4 {
  c: String;
  d: Bool?;
}

contract TestContract {
  dn: DeeplyNested;

  init() {
    self.dn = DeeplyNested{
      level1: 1,
      level2: Level2{
        a: null,
        level3: Level3{
          b: true,
          s: Level4{ c: "x", d: false }
        }
      }
    };
  }
}