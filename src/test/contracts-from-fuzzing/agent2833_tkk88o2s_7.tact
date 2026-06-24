struct BigOne {
    f1: Bool;
    f2: Bool;
    f3: Bool;
    f4: Bool;
    f5: Bool;
    f6: Bool;
    f7: Bool;
    f8: Bool;
    f9: Bool;
    f10: Bool;
    f11: Bool;
    f12: Bool;
    f13: Bool;
    f14: Bool;
    f15: Bool;
    f16: Bool;
    f17: Bool;
    f18: Bool;
    f19: Bool;
    f20: Bool;
    f21: Bool;
    f22: Bool;
    f23: Bool;
    f24: Bool;
    f25: Bool;
    f26: Bool;
    f27: Bool;
    f28: Bool;
    f29: Bool;
    f30: Bool;
    f31: Bool;
    f32: Bool;
}

contract ManyBools {
    all: BigOne;

    init() {
        self.all = BigOne{
            f1:true,f2:false,f3:true,f4:false,f5:true,f6:false,f7:true,f8:false,
            f9:true,f10:false,f11:true,f12:false,f13:true,f14:false,f15:true,f16:false,
            f17:true,f18:false,f19:true,f20:false,f21:true,f22:false,f23:true,f24:false,
            f25:true,f26:false,f27:true,f28:false,f29:true,f30:false,f31:true,f32:false
        };
    }
}