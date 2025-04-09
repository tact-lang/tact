struct DeeplyNested {
  f1: LevelTwo;
}

struct LevelTwo {
  a: LevelThree;
  b: Int;
}

struct LevelThree {
  sub: FinalInner;
}

struct FinalInner {
  x: Int?;
  y: Bool;
}

contract DeepNestTest {
  store: DeeplyNested;

  init() {
    self.store = DeeplyNested{
      f1: LevelTwo{
        a: LevelThree{
          sub: FinalInner{
            x: null,
            y: false,
          }
        },
        b: 5,
      }
    };
  }
}