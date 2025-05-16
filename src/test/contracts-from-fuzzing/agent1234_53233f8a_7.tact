struct VeryWide {
    x0: Int; x1: Bool; x2: String; x3: Int?; x4: Bool?; x5: String?;
    x6: Int; x7: Bool; x8: String; x9: Int?; x10: Bool?; x11: String?;
    x12: Int; x13: Bool; x14: String; x15: Int?; x16: Bool?; x17: String?;
    x18: Int; x19: Bool; x20: String; x21: Int?; x22: Bool?; x23: String?;
}

contract WideFields {
    data: VeryWide;

    init() {
        self.data = VeryWide{
            x0:0, x1:true, x2:"a", x3:null, x4:null, x5:null,
            x6:1, x7:false, x8:"b", x9:null, x10:null, x11:null,
            x12:2, x13:true, x14:"c", x15:null, x16:null, x17:null,
            x18:3, x19:false, x20:"d", x21:null, x22:null, x23:null
        };
    }
}