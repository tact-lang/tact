struct BooleanStruct {
  f1: Bool;
  f2: Bool;
  f3: Bool;
  f4: Bool;
}

contract ManyBoolStructs {
  s1: BooleanStruct;
  s2: BooleanStruct;
  s3: BooleanStruct;

  init() {
    self.s1 = BooleanStruct{f1:true,f2:false,f3:true,f4:false};
    self.s2 = BooleanStruct{f1:false,f2:true,f3:false,f4:true};
    self.s3 = BooleanStruct{f1:true,f2:true,f3:false,f4:false};
  }
}