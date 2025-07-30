contract HugeFlat {
    a1: Int = 1;
    a2: Int = 2;
    a3: Bool = true;
    a4: Bool = false;
    a5: String = "x";
    a6: String = "y";
    a7: Int = 7;
    a8: Int = 8;
    a9: Int = 9;
    a10: Int = 10;
    a11: Bool = true;
    a12: String = "z";
    a13: Address;
    a14: Address;
    a15: Cell;
    a16: Cell;

    init() {
        self.a13 = myAddress();
        self.a14 = myAddress();
        self.a15 = emptyCell();
        self.a16 = emptyCell();
    }
}