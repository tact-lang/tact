contract Test1 {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = myAddress();
        self.f4 = emptyCell();
        self.f5 = emptyCell().asSlice();
        self.f6 = "test";
    }
}