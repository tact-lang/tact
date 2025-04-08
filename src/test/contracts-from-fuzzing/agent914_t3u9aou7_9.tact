struct NestedStruct {
  s1: Int;
  s2: Bool;
}

contract ArrayOfStructs {
  sA: NestedStruct;
  sB: NestedStruct;
  sC: NestedStruct;

  init() {
    self.sA = NestedStruct{s1:1,s2:true};
    self.sB = NestedStruct{s1:2,s2:false};
    self.sC = NestedStruct{s1:3,s2:true};
  }
}