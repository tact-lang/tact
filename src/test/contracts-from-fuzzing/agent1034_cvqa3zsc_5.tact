contract LongFieldList {
    a0: Int;
    a1: Bool;
    a2: Address;
    a3: Cell;
    a4: Int;
    a5: Bool;
    a6: Address;
    a7: Cell;
    a8: Int;
    a9: Bool;

    init() {
        self.a0 = 1;
        self.a1 = false;
        self.a2 = myAddress();
        self.a3 = emptyCell();
        self.a4 = 2;
        self.a5 = true;
        self.a6 = myAddress();
        self.a7 = emptyCell();
        self.a8 = 3;
        self.a9 = false;
    }
}