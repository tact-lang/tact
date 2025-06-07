struct BigStruct {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Bool;
    f7: Bool;
    f8: Bool;
    f9: Bool;
    f10: String;
    f11: String;
    f12: Int?;
    f13: String?;
}

contract BigStructField {
    big: BigStruct;

    init() {
      self.big = BigStruct{
        f1:1,f2:2,f3:3,f4:4,f5:5,
        f6:true,f7:false,f8:true,f9:false,
        f10:"a",f11:"b",
        f12:null,f13:null
      };
    }
}