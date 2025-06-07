struct Huge {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: Int?;
    f10: Bool?;
    f11: String;
    f12: String?;
    f13: Int;
    f14: Bool;
    f15: Int?;
    f16: Bool?;
    f17: String;
    f18: String?;
    f19: Int;
    f20: Bool;
    f21: Int?;
    f22: Bool?;
    f23: String;
    f24: String?;
    f25: Int;
    f26: Bool;
    f27: Int?;
    f28: Bool?;
    f29: String;
    f30: String?;
    f31: Int;
    f32: Bool;
    f33: Int?;
    f34: Bool?;
    f35: String;
}

contract StressLarge {
    big: Huge;
    init() {
        self.big = Huge{
            f1:1, f2:true, f3:null, f4:null, f5:"a", f6:null, f7:2, f8:false, f9:null, f10:true,
            f11:"b", f12:null, f13:3, f14:true, f15:null, f16:false, f17:"c", f18:null, f19:4, f20:false,
            f21:null, f22:true, f23:"d", f24:null, f25:5, f26:true, f27:null, f28:false, f29:"e", f30:null,
            f31:6, f32:false, f33:null, f34:true, f35:"f",
        };
    }
}