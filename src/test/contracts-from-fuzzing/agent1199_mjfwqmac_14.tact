struct BoolStruct {
  b1: Bool;
  b2: Bool;
  b3: Bool;
  b4: Bool;
}

contract Test14 {
  field: BoolStruct;

  init() {
    self.field = BoolStruct{b1:true,b2:false,b3:true,b4:false};
  }
}