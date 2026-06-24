struct LongStruct {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: String;
    f5: Int?;
    f6: Bool?;
    f7: String;
    f8: Int;
    f9: Bool;
    f10: String;
    f11: Int;
    f12: Bool?;
    f13: String?;
    f14: Int;
    f15: Bool;
    f16: String;
}

contract ManyFields {
    d: LongStruct;

    init() {
        self.d = LongStruct{
            f1:1,f2:2,f3:true,f4:"a",f5:null,f6:false,f7:"b",f8:8,f9:true,f10:"c",
            f11:11,f12:null,f13:null,f14:14,f15:false,f16:"d"
        };
    }
}