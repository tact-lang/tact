contract LongFields {
    a0: Int = 0;
    a1: Int = 1;
    a2: Bool = true;
    a3: Bool = false;
    a4: Int? = null;
    a5: Bool? = null;
    a6: String = "a";
    a7: String = "b";
    a8: Address;
    a9: Cell;
    a10: Slice;
    a11: String = "c";
    a12: Int = 12;
    a13: Int? = 13;
    a14: Bool? = true;
    a15: Bool = true;
    a16: Int = 16;
    a17: String = "d";
    a18: Int? = null;
    a19: Bool? = null;

    init() {
        self.a8 = myAddress();
        self.a9 = emptyCell();
        self.a10 = emptyCell().asSlice();
    }
}