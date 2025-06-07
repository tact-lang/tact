struct TenFields {
  f1: Int;
  f2: Int?;
  f3: Bool;
  f4: Bool?;
  f5: String;
  f6: String?;
  f7: Address;
  f8: Address?;
  f9: Cell;
  f10: Cell?;
}

contract ManyFields {
  s: TenFields;
  init() {
    self.s = TenFields{
      f1:1, f2:null, f3:false, f4:true,
      f5:"a", f6:null, f7: myAddress(), f8: null,
      f9: emptyCell(), f10: null
    };
  }
}