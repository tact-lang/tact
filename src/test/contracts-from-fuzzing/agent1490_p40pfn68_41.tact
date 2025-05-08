contract MegaFields {
    a1: Int;
    a2: Int?;
    a3: Bool;
    a4: Bool?;
    a5: String;
    a6: String?;
    a7: Address;
    a8: Address?;
    a9: Cell;
    a10: Cell?;
    a11: Slice;
    a12: Slice?;
    a13: Builder;
    a14: Builder?;
    a15: Int as uint8;
    a16: Int? as uint8;
    a17: Int as int16;
    a18: Int? as int16;
    a19: Int as coins;
    a20: Int? as coins;

    init() {
        self.a1 = 1;
        self.a2 = null;
        self.a3 = true;
        self.a4 = null;
        self.a5 = "A";
        self.a6 = null;
        self.a7 = myAddress();
        self.a8 = null;
        self.a9 = emptyCell();
        self.a10 = null;
        self.a11 = emptyCell().asSlice();
        self.a12 = null;
        self.a13 = beginCell();
        self.a14 = null;
        self.a15 = 255;
        self.a16 = null;
        self.a17 = 123;
        self.a18 = null;
        self.a19 = ton("1");
        self.a20 = null;
    }
}