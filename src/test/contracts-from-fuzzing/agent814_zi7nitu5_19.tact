struct Large {
    a1: Int;
    a2: Int?;
    a3: Int;
    a4: Int?;
    a5: Int;
    a6: Int?;
    a7: Int;
    a8: Int?;
    a9: Int;
    a10: Int?;
    a11: Int;
    a12: Int?;
    a13: Int;
    a14: Int?;
    a15: Int;
    a16: Int?;
    a17: Int;
    a18: Int?;
    a19: Int;
    a20: Int?;
    a21: Int;
    a22: Int?;
    a23: Int;
    a24: Int?;
    a25: Int;
    a26: Int?;
    a27: Int;
    a28: Int?;
    a29: Int;
    a30: Int?;
    a31: Int;
}

contract TestContract {
    stuff: Large;

    init() {
        self.stuff = Large{
            a1:1, a2:null, a3:2, a4:null, a5:3, a6:null, a7:4, a8:null, a9:5, a10:null,
            a11:6, a12:null, a13:7, a14:null, a15:8, a16:null, a17:9, a18:null, a19:10, a20:null,
            a21:11, a22:null, a23:12, a24:null, a25:13, a26:null, a27:14, a28:null, a29:15, a30:null,
            a31:16
        };
    }
}