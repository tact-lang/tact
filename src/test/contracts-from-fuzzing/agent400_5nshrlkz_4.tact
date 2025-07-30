struct DeepOptional {
  lvl1: Level1?;
}

struct Level1 {
  lvl2: Level2?;
}

struct Level2 {
  lvl3: Level3?;
}

struct Level3 {
  value: Int?;
}

contract TestDeepOpt {
  data: DeepOptional;

  init() {
    self.data = DeepOptional {
      lvl1: null
    };
  }

  receive() {
    if (self.data.lvl1 != null) {
      if (self.data.lvl1!!.lvl2 != null) {
        if (self.data.lvl1!!.lvl2!!.lvl3 != null) {
          let _ = self.data.lvl1!!.lvl2!!.lvl3!!.value;
        }
      }
    }
  }
}