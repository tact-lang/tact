struct BigFields {
    f1: Int; f2: Bool; f3: String; f4: Int?; f5: Bool?; f6: String?;
    f7: Int; f8: Bool; f9: String; f10: Int?; f11: Bool?; f12: String?;
    f13: Int; f14: Bool; f15: String; f16: Int?; f17: Bool?; f18: String?;
}

contract ManyFields {
    storage: BigFields;

    init() {
        self.storage = BigFields{
            f1:1, f2:true, f3:"a", f4:null, f5:false, f6:null,
            f7:2, f8:false, f9:"b", f10:null, f11:true, f12:null,
            f13:3, f14:true, f15:"c", f16:null, f17:false, f18:null
        };
    }
}