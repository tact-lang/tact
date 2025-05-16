struct DeepLevel3 {
  value: Int;
}

struct DeepLevel2 {
  lvl3: DeepLevel3;
}

struct DeepLevel1 {
  lvl2: DeepLevel2;
}

contract VeryDeepNested {
  root: DeepLevel1;

  init() {
    self.root = DeepLevel1{
      lvl2: DeepLevel2{
        lvl3: DeepLevel3{
          value: 123
        }
      }
    };
  }
}