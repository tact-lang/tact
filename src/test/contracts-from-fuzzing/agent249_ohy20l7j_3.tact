struct MassiveFields {
    f1: Int; f2: Int; f3: Int; f4: Int; f5: Int;
    f6: Int; f7: Int; f8: Int; f9: Int; f10: Int;
    f11: Int; f12: Int; f13: Int; f14: Int; f15: Int;
    f16: Int; f17: Int; f18: Int; f19: Int; f20: Int;
}

contract ManyFieldsTest {
    m: MassiveFields;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool;
    s1: String; s2: String;
    c1: Cell; c2: Cell;
    addr1: Address; addr2: Address;

    init() {
        self.m = MassiveFields{
            f1:1,f2:2,f3:3,f4:4,f5:5,
            f6:6,f7:7,f8:8,f9:9,f10:10,
            f11:11,f12:12,f13:13,f14:14,f15:15,
            f16:16,f17:17,f18:18,f19:19,f20:20
        };
        self.b1 = true;
        self.b2 = false;
        self.b3 = true;
        self.b4 = false;
        self.s1 = "str1";
        self.s2 = "str2";
        self.c1 = emptyCell();
        self.c2 = emptyCell();
        self.addr1 = myAddress();
        self.addr2 = myAddress();
    }
}
