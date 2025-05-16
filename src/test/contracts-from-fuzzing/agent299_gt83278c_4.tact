contract TestContract {
    a0: Int;
    a1: Int as uint8;
    a2: Int;
    a3: Int as int64;
    a4: Int as uint32;
    a5: Bool;
    a6: Bool;
    a7: Address;
    a8: Address;
    a9: Cell;
    a10: Cell;
    a11: Slice;
    a12: Slice;
    a13: String;
    a14: String;
    a15: Int;
    a16: Int as uint8;
    a17: Int as int256;
    a18: Bool;
    a19: Address;
    a20: Cell;
    a21: Slice;
    a22: String;
    a23: Int;
    a24: Bool;

    init() {
        self.a0 = 0;
        self.a1 = 1;
        self.a2 = 2;
        self.a3 = 3;
        self.a4 = 4;
        self.a5 = true;
        self.a6 = false;
        self.a7 = myAddress();
        self.a8 = myAddress();
        self.a9 = emptyCell();
        self.a10 = emptyCell();
        self.a11 = emptyCell().asSlice();
        self.a12 = emptyCell().asSlice();
        self.a13 = "a";
        self.a14 = "b";
        self.a15 = 15;
        self.a16 = 16;
        self.a17 = 17;
        self.a18 = true;
        self.a19 = myAddress();
        self.a20 = emptyCell();
        self.a21 = emptyCell().asSlice();
        self.a22 = "c";
        self.a23 = 23;
        self.a24 = false;
    }
}