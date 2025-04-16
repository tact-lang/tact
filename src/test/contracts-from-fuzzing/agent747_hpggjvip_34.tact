struct HugeStruct {
    a1: Int;
    a2: Int?;
    a3: Bool;
    a4: String;
    a5: Int as uint8;
    a6: Int as int16;
    a7: Bool?;
    a8: String?;
    a9: Int;
    a10: Int?;
    a11: Bool;
    a12: String;
    a13: Int as uint8;
    a14: Int as int16;
    a15: Bool?;
    a16: String?;
    a17: Int;
    a18: Int?;
    a19: Bool;
    a20: String;
    a21: Int as uint8;
    a22: Int as int16;
    a23: Bool?;
    a24: String?;
    a25: Int; 
    a26: Int?; 
    a27: Bool; 
    a28: String; 
    a29: Int as uint8; 
    a30: Int as int16; 
    a31: Bool?; 
    a32: String?; 
}

contract HugeContract {
    big: HugeStruct;

    init() {
        self.big = HugeStruct {
            a1: 1, a2: null, a3: true, a4: "s1",
            a5: 5, a6: -6, a7: false, a8: null,
            a9: 9, a10: null, a11: false, a12: "s2",
            a13: 13, a14: -14, a15: true, a16: null,
            a17: 17, a18: null, a19: true, a20: "s3",
            a21: 21, a22: -22, a23: null, a24: "s4",
            a25: 25, a26: null, a27: false, a28: "s5",
            a29: 29, a30: -30, a31: null, a32: "s6"
        };
    }
}