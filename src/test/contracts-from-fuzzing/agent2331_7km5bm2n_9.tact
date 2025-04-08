struct SLevel3 {
  val: Int;
}

struct SLevel2 {
  nested: SLevel3;
}

struct SLevel1 {
  nested: SLevel2;
}

contract Test {
  s: SLevel1;
  init() {
    self.s = SLevel1{nested: SLevel2{nested: SLevel3{val: 42}}};
  }
}