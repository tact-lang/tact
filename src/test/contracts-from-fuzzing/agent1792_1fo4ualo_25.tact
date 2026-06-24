struct LargeOptionalStruct {
    o1: Int?; o2: Int?; o3: Int?; o4: Int?; o5: Int?;
    o6: Int?; o7: Int?; o8: Int?; o9: Int?; o10: Int?;
    o11: Bool?; o12: Bool?; o13: Bool?; o14: Bool?; o15: Bool?;
    o16: Bool?; o17: Bool?; o18: Bool?; o19: Bool?; o20: Bool?;
    o21: String?; o22: String?; o23: String?; o24: String?; o25: String?;
    o26: String?; o27: String?; o28: String?; o29: String?; o30: String?;
    o31: Int?; o32: Bool?; o33: String?; o34: Int?; o35: String?;
}

contract HugeOptionalBitmap {
    huge: LargeOptionalStruct;

    init() {
        self.huge = LargeOptionalStruct{
            o1:null,o2:null,o3:null,o4:null,o5:null,o6:null,o7:null,o8:null,o9:null,o10:null,
            o11:null,o12:null,o13:null,o14:null,o15:null,o16:null,o17:null,o18:null,o19:null,o20:null,
            o21:null,o22:null,o23:null,o24:null,o25:null,o26:null,o27:null,o28:null,o29:null,o30:null,
            o31:null,o32:null,o33:null,o34:null,o35:null
        };
    }
}