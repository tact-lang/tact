contract Test {
    s1: Int;
    s2: Bool;
    s3: Address;
    s4: Cell;
    s5: Slice;
    s6: String;
    s7: Int?;
    s8: Bool?;
    s9: Address?;
    s10: String?;

    init() {
        self.s1 = 1;
        self.s2 = true;
        self.s3 = myAddress();
        self.s4 = emptyCell();
        self.s5 = emptyCell().asSlice();
        self.s6 = "s";
        self.s7 = null;
        self.s8 = null;
        self.s9 = null;
        self.s10 = null;
    }
}