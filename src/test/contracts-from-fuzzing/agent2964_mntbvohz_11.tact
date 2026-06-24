struct StructA {
  valueA: Int;
}

struct StructB {
  valueB: Int;
}

struct WrapperStruct {
  sa: StructA;
  sb: StructB;
}

contract WrapTwoStructs {
  w: WrapperStruct;

  init() {
    self.w = WrapperStruct{
      sa: StructA{valueA:1},
      sb: StructB{valueB:2}
    };
  }
}