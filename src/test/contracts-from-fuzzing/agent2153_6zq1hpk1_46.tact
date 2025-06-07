// multiple nested levels with mixed defaults and nulls
struct Bottom {
  x: Int;
  y: Bool?;
}

struct Middle {
  bot: Bottom;
  z: String?;
}

struct Top {
  mid: Middle;
  flag: Bool;
}

contract MixDeep {
  data: Top;
  init() {
    self.data = Top{
      mid: Middle{
        bot: Bottom{ x: 7, y: null },
        z: null
      },
      flag: true
    };
  }
}
