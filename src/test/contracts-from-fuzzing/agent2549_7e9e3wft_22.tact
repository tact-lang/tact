struct LVL1 {
  val1: Int;
  lvl2: LVL2;
}

struct LVL2 {
  val2: Int;
  lvl3: LVL3;
}

struct LVL3 {
  val3: Int;
}

contract RecursivelyDeep {
  d: LVL1;
  
  init() {
    self.d = LVL1{
      val1: 1,
      lvl2: LVL2{
        val2: 2,
        lvl3: LVL3{ val3:3 }
      }
    };
  }
}