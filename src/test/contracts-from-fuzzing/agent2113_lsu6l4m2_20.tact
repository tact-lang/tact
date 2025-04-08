struct Many {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Int?;
  f5: String?;
  f6: Cell;
  f7: Cell?;
  f8: Address;
  f9: Address?;
}

contract ComboFields {
  m: Many;

  init() {
    self.m = Many{
      f1:1, f2:true, f3:"hi", f4:null, f5:null,
      f6:emptyCell(), f7:null, f8:myAddress(), f9:null
    };
  }
}