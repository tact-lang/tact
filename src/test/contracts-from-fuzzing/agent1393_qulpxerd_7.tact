struct ContainStruct {
  a: Int;
  b: Bool;
}

contract StructInFieldMany {
  s1: ContainStruct;
  s2: ContainStruct;
  s3: ContainStruct;
  s4: ContainStruct;

  init() {
    self.s1 = ContainStruct{ a:1, b:true };
    self.s2 = ContainStruct{ a:2, b:false };
    self.s3 = ContainStruct{ a:3, b:true };
    self.s4 = ContainStruct{ a:4, b:false };
  }
}
