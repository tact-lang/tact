contract TestContract {
    s1: Int;
    s2: Bool;
    s3: Address;
    s4: Cell;
    s5: Slice;
    s6: String;
    s7: Int?;

    init() {
        self.s1 = 1;
        self.s2 = true;
        self.s3 = myAddress();
        self.s4 = emptyCell();
        self.s5 = self.s4.asSlice();
        self.s6 = "hello";
        self.s7 = null;
    }
}