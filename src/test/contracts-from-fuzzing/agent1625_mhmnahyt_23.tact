struct Top {
  mid: MidLevel;
}

struct MidLevel {
  bottom: BottomLevel;
}

struct BottomLevel {
  maybe: Int?;
  flag: Bool;
}

contract ManyLayersOptional {
  s: Top;

  init() {
    self.s = Top{
      mid: MidLevel{
        bottom: BottomLevel{
          maybe: null,
          flag: true,
        }
      }
    };
  }
}
