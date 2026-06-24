contract TestContract {
    x1: Int;
    x2: Bool;
    x3: String;
    x4: Address;
    x5: Cell;
    x6: Slice;
    x7: Builder;

    init() {
        self.x1 = 1;
        self.x2 = true;
        self.x3 = "hello";
        self.x4 = myAddress();
        self.x5 = emptyCell();
        self.x6 = emptyCell().asSlice();
        self.x7 = beginCell();
    }
}
