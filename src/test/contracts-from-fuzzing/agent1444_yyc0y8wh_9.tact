struct LevelA {
  b: LevelB;
}

struct LevelB {
  c: LevelC;
}

struct LevelC {
  d: LevelD;
}

struct LevelD {
  val: Int;
  s: String;
}

contract TestDeep4 {
  data: LevelA;
  init() {
    self.data = LevelA{
      b: LevelB{
        c: LevelC{
          d: LevelD{
            val: 999,
            s: "deep"
          }
        }
      }
    };
  }
}
