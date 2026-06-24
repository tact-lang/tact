struct DeepNest {
  lvl1: Int;
  lvl2: DeepNest2;
}

struct DeepNest2 {
  lvl3: Int;
  lvl4: DeepNest3;
}

struct DeepNest3 {
  lvl5: Int;
}

contract Test {
  state: DeepNest;

  init() {
    self.state = DeepNest{
      lvl1: 1,
      lvl2: DeepNest2{
        lvl3: 3,
        lvl4: DeepNest3{ lvl5: 5 },
      },
    };
  }
}
