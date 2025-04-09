struct TenFields {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Cell;
  f5: Slice;
  f6: Address;
  f7: Int?;
  f8: Bool;
  f9: String;
  f10: Address;
}

contract ManyFieldsContract {
    data: TenFields;
    
    init() {
        self.data = TenFields{
            f1:1, f2:true, f3:"s", f4:emptyCell(), f5:emptyCell().asSlice(),
            f6:myAddress(), f7:null, f8:false, f9:"t", f10:myAddress()
        };
    }
}