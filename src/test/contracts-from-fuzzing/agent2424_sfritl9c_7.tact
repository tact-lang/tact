contract LongList {
    a0: Int;
    a1: Int;
    a2: Bool;
    a3: String;
    a4: Cell;
    a5: Address;
    a6: Int?;
    a7: Bool?;
    a8: String?;
    a9: Cell?;
    a10: Address?;
    a11: Int as uint32;
    a12: Int as int64;
    a13: Int as uint4;

    init() {
        self.a0 = 0;
        self.a1 = 1;
        self.a2 = true;
        self.a3 = "Hi";
        self.a4 = emptyCell();
        self.a5 = myAddress();
        self.a6 = null;
        self.a7 = null;
        self.a8 = null;
        self.a9 = null;
        self.a10 = null;
        self.a11 = 42;
        self.a12 = 64;
        self.a13 = 5;
    }
}