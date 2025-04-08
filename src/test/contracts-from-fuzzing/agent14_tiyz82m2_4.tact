struct Large {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Bool?;
    f5: String?;
    f6: Int;
    f7: Bool;
    f8: String;
    f9: Bool?;
    f10: String?;
    f11: Int;
    f12: Bool;
    f13: String;
    f14: Bool?;
    f15: String?;
    f16: Int;
    f17: Bool;
    f18: String;
    f19: Bool?;
    f20: String?;
}

contract LargeStructVar {
    s: Large;
    
    init() {
        self.s = Large{
            f1:1, f2:true, f3:"a", f4:false, f5:null,
            f6:6, f7:false, f8:"b", f9:true, f10:"c",
            f11:11, f12:true, f13:"d", f14:null, f15:"e",
            f16:16, f17:false, f18:"f", f19:null, f20:null,
        };
    }
}