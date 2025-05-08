contract LargePrimitives {
    a0: Int;
    a1: Bool;
    a2: Address;
    a3: Cell;
    a4: Slice;
    a5: String;
    a6: Int;
    a7: Bool;
    a8: Address;
    a9: Cell;
    a10: Slice;
    a11: String;
    a12: Int;
    a13: Bool;
    a14: Address;
    a15: Cell;
    
    init() {
        self.a0 = 0;
        self.a1 = true;
        self.a2 = myAddress();
        self.a3 = emptyCell();
        self.a4 = emptyCell().asSlice();
        self.a5 = "";
        self.a6 = 1;
        self.a7 = false;
        self.a8 = myAddress();
        self.a9 = emptyCell();
        self.a10 = emptyCell().asSlice();
        self.a11 = "hi";
        self.a12 = -1;
        self.a13 = true;
        self.a14 = myAddress();
        self.a15 = emptyCell();
    }
}