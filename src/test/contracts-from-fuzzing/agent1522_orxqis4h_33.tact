struct DeepNest {
  a: Int;
  b: Bool;
}

struct LevelSecond {
  d1: DeepNest;
  d2: DeepNest;
}

struct LevelTop {
  l: LevelSecond;
  x: Int;
}

contract NestingChain {
  data: LevelTop;

  init() {
    self.data = LevelTop{
      l: LevelSecond{
        d1: DeepNest{a:1,b:true},
        d2: DeepNest{a:2,b:false},
      },
      x: 999,
    };
  }

  receive() {
    let _ = self.data;
  }
}