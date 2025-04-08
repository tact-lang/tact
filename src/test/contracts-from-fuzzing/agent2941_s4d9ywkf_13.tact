struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int;
    f11: Bool;
    f12: String;
    f13: Int?;
    f14: Bool?;
    f15: String?;
    f16: Int;
    f17: Bool;
    f18: String;
    f19: Int;
    f20: Bool;
}

contract HugeFields {
    big: BigStruct;

    init() {
        self.big = BigStruct {
            f1:1, f2:true, f3:"a", f4:null, f5:null, f6:null,
            f7:7, f8:false, f9:"i", f10:10, f11:true, f12:"l",
            f13:13, f14:true, f15:"o", f16:16, f17:false, f18:"r",
            f19:19, f20:true,
        };
    }
}