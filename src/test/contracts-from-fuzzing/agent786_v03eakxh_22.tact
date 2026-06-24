contract LongContract {
    a1: Int = 1;
    a2: Bool = true;
    a3: Int = 3;
    a4: Bool = false;
    a5: String = "five";
    a6: Address;
    a7: Int = 7;
    a8: String = "eight";
    a9: Int = 9;
    a10: Cell;
    a11: Slice;
    a12: Int = 12;

    init() {
        self.a6 = myAddress();
        self.a10 = emptyCell();
        self.a11 = emptyCell().asSlice();
    }
}