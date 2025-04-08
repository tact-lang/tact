struct ManyNils {
    f1: Int?; f2: Int?; f3: Int?; f4: Int?; f5: Int?; f6: Int?; f7: Int?; f8: Int?; f9: Int?; f10: Int?;
    f11: String?; f12: String?; f13: String?; f14: String?; f15: String?; f16: String?; f17: String?; f18: String?; f19: String?; f20: String?;
    f21: Bool?; f22: Bool?; f23: Bool?; f24: Bool?; f25: Bool?; f26: Bool?; f27: Bool?; f28: Bool?; f29: Bool?; f30: Bool?;
}

contract TestContract {
    vals: ManyNils;

    init() {
        self.vals = ManyNils {
            f1:null, f2:null, f3:null, f4:null, f5:null, f6:null, f7:null, f8:null, f9:null, f10:null,
            f11:null, f12:null, f13:null, f14:null, f15:null, f16:null, f17:null, f18:null, f19:null, f20:null,
            f21:null, f22:null, f23:null, f24:null, f25:null, f26:null, f27:null, f28:null, f29:null, f30:null
        };
    }
}