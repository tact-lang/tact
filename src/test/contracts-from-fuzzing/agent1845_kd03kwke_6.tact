struct BigOptionalStruct {
  f1: Int?;
  f2: Int?;
  f3: Int?;
  f4: Int?;
  f5: Int?;
}

contract TestBigOptionalStruct {
  s: BigOptionalStruct;

  init() {
    self.s = BigOptionalStruct{
      f1:null, f2:null, f3:null, f4:null, f5:null
    };
  }
}
