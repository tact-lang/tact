struct Wide {
  f1: Int;
  f2: Int;
  f3: Bool;
  f4: String;
  f5: Address;
  f6: Int?;
  f7: Bool?;
  f8: String?;
  f9: Address?;
  f10: Int;
  f11: Bool;
  f12: String;
}

contract TestContract {
    wideField: Wide;

    init() {
        self.wideField = Wide{
            f1:1,f2:2,f3:true,f4:"aaa",f5:myAddress(),
            f6:6,f7:false,f8:null,f9:null,f10:10,f11:false,f12:"bbb"
        };
    }
}