struct BigOptional {
    x1: Int?; x2: Int?; x3: Int?; x4: Int?; x5: Int?;
    x6: Int?; x7: Int?; x8: Int?; x9: Int?; x10: Int?;
    x11: Int?; x12: Int?; x13: Int?; x14: Int?; x15: Int?;
    x16: Int?; x17: Int?; x18: Int?; x19: Int?; x20: Int?;
}

contract BigOptionalFields {
    data: BigOptional;

    init() {
        self.data = BigOptional{
            x1:null,x2:null,x3:null,x4:null,x5:null,
            x6:null,x7:null,x8:null,x9:null,x10:null,
            x11:null,x12:null,x13:null,x14:null,x15:null,
            x16:null,x17:null,x18:null,x19:null,x20:null
        };
    }
}