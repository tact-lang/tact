struct DoubleNested {
  lv1: Level1;
}

struct Level1 {
  lv2: Level2;
}

struct Level2 {
  lv3: Leaf;
}

struct Leaf {
  num: Int;
  flag: Bool?;
  name: String;
}

contract DeepContract {
  d: DoubleNested;

  init() {
    self.d = DoubleNested{
      lv1: Level1{
        lv2: Level2{
          lv3: Leaf{
            num: 55, flag: null, name: "deep"
          }
        }
      }
    };
  }
}