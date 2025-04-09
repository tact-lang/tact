struct ComplexNested {
  level1: L1;
}

struct L1 {
  level2: L2;
}

struct L2 {
  level3: L3;
}

struct L3 {
  deepInt: Int?;
  deepStr: String?;
}

contract VeryDeep {
  f: ComplexNested;
  init() {
    self.f = ComplexNested{
      level1: L1{
        level2: L2{
          level3: L3{deepInt:null, deepStr:"hi"}
        }
      }
    };
  }
}