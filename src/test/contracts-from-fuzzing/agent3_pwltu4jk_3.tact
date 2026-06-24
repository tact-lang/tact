contract ManyFields {
    f1: Int = 1;
    f2: Bool = true;
    f3: Address; // no default
    f4: Cell;    // no default
    f5: Slice;   // no default
    f6: String = "str";
    f7: Int? = null;
    f8: Bool? = null;
    f9: Address? = null;
    f10: Cell? = null;

    init() {
        self.f1 = 10;
        self.f2 = false;
        self.f3 = myAddress();
        self.f4 = emptyCell();
        self.f5 = emptyCell().asSlice();
        self.f6 = "done";
        self.f7 = 7;
        self.f8 = true;
        self.f9 = myAddress();
        self.f10 = emptyCell();
    }
}