struct DeepLevel3 {
  d3int: Int;
}

struct DeepLevel2 {
  d2int: Int;
  d3: DeepLevel3;
}

struct DeepLevel1 {
  d1int: Int;
  d2: DeepLevel2;
}

contract VeryDeep {
  deep: DeepLevel1;

  init() {
    self.deep = DeepLevel1{d1int:1, d2: DeepLevel2{d2int:2, d3: DeepLevel3{d3int:3}}};
  }
}