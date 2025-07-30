struct Large {
  f1: Int;
  f2: Int;
  f3: Bool;
  f4: Bool;
  f5: Bool;
  f6: String;
  f7: Address;
  f8: String;
  f9: Int?;
  f10: Bool?;
  f11: String?;
  f12: Address?;
  f13: Cell;
  f14: Slice;
}

contract LargeContractFields {
  st: Large;

  init() {
    self.st = Large{
      f1:1,f2:2,f3:true,f4:false,f5:true,
      f6:"a",f7:myAddress(),f8:"b",
      f9:null,f10:null,f11:null,f12:null,
      f13:emptyCell(),f14:emptyCell().asSlice()
    };
  }
}
