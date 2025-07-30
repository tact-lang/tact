contract LongFields {
    a1: Int;
    a2: Bool;
    a3: Address;
    a4: Bool?;
    a5: String;
    a6: Cell;
    a7: Slice;
    a8: String?;
    a9: Int?;
    a10: Address;
    a11: Bool;
    a12: String;
    a13: Cell;
    a14: Slice;
    a15: String;
    a16: Int;
    a17: Bool?;
    a18: Int?;
    a19: String;
    a20: Address;

    init() {
        self.a1 = 1;
        self.a2 = true;
        self.a3 = myAddress();
        self.a4 = null;
        self.a5 = "s";
        self.a6 = emptyCell();
        self.a7 = self.a6.asSlice();
        self.a8 = null;
        self.a9 = null;
        self.a10 = myAddress();
        self.a11 = false;
        self.a12 = "x";
        self.a13 = emptyCell();
        self.a14 = self.a13.asSlice();
        self.a15 = "y";
        self.a16 = 2;
        self.a17 = true;
        self.a18 = 100;
        self.a19 = "z";
        self.a20 = myAddress();
    }
}
