struct DeepLvl4 {
  val: Int;
}

struct DeepLvl3 {
  deeper: DeepLvl4;
}

struct DeepLvl2 {
  deeper: DeepLvl3;
}

struct DeepLvl1 {
  deeper: DeepLvl2;
}

contract UltraDeepTest {
  root: DeepLvl1;

  init() {
    self.root = DeepLvl1{
      deeper: DeepLvl2{
        deeper: DeepLvl3{
          deeper: DeepLvl4{
            val: 42
          }
        }
      }
    };
  }
}