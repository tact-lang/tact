struct DeeplyOptional {
  lvl1: Lvl1?;
}

struct Lvl1 {
  lvl2: Lvl2?;
}

struct Lvl2 {
  lvl3: Lvl3?;
}

struct Lvl3 {
  val: Int?;
}

contract TestContract {
  data: DeeplyOptional;

  init() {
    self.data = DeeplyOptional {
      lvl1: Lvl1 {
        lvl2: Lvl2 {
          lvl3: Lvl3 {
            val: 1
          }
        }
      }
    };
  }
}