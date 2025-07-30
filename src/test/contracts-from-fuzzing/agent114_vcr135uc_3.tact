struct ManyFields {
    f1: Int; f2: Int; f3: Int; f4: Int; f5: Int;
    f6: Bool; f7: Bool; f8: String; f9: String; f10: Bool?;
    f11: Int?; f12: String; f13: Bool; f14: String?; f15: Int;
    f16: Bool?; f17: String; f18: Int; f19: Bool; f20: String;
    f21: Int?; f22: Bool?; f23: String?; f24: Int; f25: String;
}

contract TestManyFields {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            f1:1, f2:2, f3:3, f4:4, f5:5,
            f6:true, f7:false, f8:"a", f9:"b", f10:null,
            f11:null, f12:"c", f13:true, f14:null, f15:6,
            f16:null, f17:"d", f18:7, f19:false, f20:"e",
            f21:null, f22:null, f23:null, f24:8, f25:"f",
        };
    }
}
