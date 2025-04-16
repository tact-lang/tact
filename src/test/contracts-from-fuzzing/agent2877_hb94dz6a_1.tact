contract A {
    s1: Int;
    s2: Bool;
    s3: Address;
    s4: Cell;
    s5: Slice;
    s6: String;
    
    init() {
        self.s1 = 1;
        self.s2 = true;
        self.s3 = myAddress();
        self.s4 = emptyCell();
        self.s5 = emptyCell().asSlice();
        self.s6 = "abc";
    }
}