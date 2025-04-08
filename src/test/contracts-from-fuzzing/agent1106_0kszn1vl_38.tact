struct RecStruct1 {
  a: Int;
}

struct RecStruct2 {
  rs1: RecStruct1?;
}

contract RecStructNestedOptional {
  field: RecStruct2;

  init() {
    self.field = RecStruct2{ rs1: null };
  }
}