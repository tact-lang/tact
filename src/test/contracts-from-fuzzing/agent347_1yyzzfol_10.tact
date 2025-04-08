struct FiftyFields {
    f1: Int; f2: Int; f3: Int; f4: Int; f5: Int;
    f6: Int; f7: Int; f8: Int; f9: Int; f10: Int;
    f11: Bool; f12: Bool; f13: Bool; f14: Bool; f15: Bool;
    f16: Bool; f17: Bool; f18: Bool; f19: Bool; f20: Bool;
    f21: String; f22: String; f23: String; f24: String; f25: String;
    f26: Int?; f27: Int?; f28: Int?; f29: Int?; f30: Int?;
    f31: Bool?; f32: Bool?; f33: Bool?; f34: Bool?; f35: Bool?;
    f36: String?; f37: String?; f38: String?; f39: String?; f40: String?;
    f41: Int; f42: Bool; f43: String; f44: Int?; f45: Bool?;
    f46: String?; f47: Int; f48: Bool; f49: String; f50: Int;
}

contract BigFlatStorage {
    state: FiftyFields;

    init() {
        self.state = FiftyFields{
            f1:1,f2:2,f3:3,f4:4,f5:5,
            f6:6,f7:7,f8:8,f9:9,f10:10,
            f11:true,f12:false,f13:true,f14:false,f15:true,
            f16:false,f17:true,f18:false,f19:true,f20:false,
            f21:"a",f22:"b",f23:"c",f24:"d",f25:"e",
            f26:null,f27:27,f28:null,f29:29,f30:null,
            f31:true,f32:null,f33:false,f34:null,f35:true,
            f36:"x",f37:null,f38:"y",f39:null,f40:"z",
            f41:41,f42:true,f43:"hi",f44:44,f45:null,
            f46:null,f47:47,f48:false,f49:"last",f50:50
        };
    }
}