struct ManyFields {
    f1: Int; f2: Bool?; f3: Int?; f4: Bool;
    f5: Int; f6: Bool?; f7: Int?; f8: Bool;
    f9: Int; f10: Bool?; f11: Int?; f12: Bool;
    f13: Int; f14: Bool?; f15: Int?; f16: Bool;
    f17: Int; f18: Bool?; f19: Int?; f20: Bool;
    f21: Int; f22: Bool?; f23: Int?; f24: Bool;
    f25: Int; f26: Bool?; f27: Int?; f28: Bool;
    f29: Int; f30: Bool?;
}

contract TestContract {
    huge: ManyFields;

    init() {
        self.huge = ManyFields{
            f1:1, f2:true, f3:null, f4:false,
            f5:5, f6:null, f7:7, f8:true,
            f9:9, f10:false, f11:11, f12:false,
            f13:13, f14:null, f15:null, f16:true,
            f17:17, f18:true, f19:null, f20:true,
            f21:21, f22:null, f23:23, f24:false,
            f25:25, f26:true, f27:27, f28:false,
            f29:29, f30:null
        };
    }
}
