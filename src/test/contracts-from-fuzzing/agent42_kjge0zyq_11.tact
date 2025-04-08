struct Biggie {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: String;
    f5: Int;
    f6: Bool?;
    f7: String;
    f8: Int?;
    f9: Bool;
    f10: String;
    f11: Int;
    f12: Bool?;
    f13: String;
    f14: Int?;
    f15: Bool;
    f16: String;
    f17: Int;
    f18: Bool?;
    f19: String;
    f20: Int?;
    f21: Bool;
    f22: String;
    f23: Int;
    f24: Bool?;
    f25: String;
    f26: Int?;
    f27: Bool;
    f28: String;
    f29: Int;
    f30: Bool?;
    f31: String;
    f32: Int?;
    f33: Bool;
}

contract BigStructContract {
    b: Biggie;

    init() {
        self.b = Biggie{
            f1:1,f2:true,f3:null,f4:"",f5:1,f6:null,f7:"",f8:null,f9:true,f10:"",
            f11:1,f12:null,f13:"",f14:null,f15:true,f16:"",f17:1,f18:null,f19:"",
            f20:null,f21:true,f22:"",f23:1,f24:null,f25:"",f26:null,f27:true,f28:"",
            f29:1,f30:null,f31:"",f32:null,f33:true
        };
    }
}