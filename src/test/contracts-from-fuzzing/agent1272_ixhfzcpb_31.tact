contract InitDefaultsToplevel {
    a: Int = 123;
    b: Bool = false;
    c: String = "init";
    d: Slice;
    e: Cell;
    f: Address;
    
    init() {
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = myAddress();
    }
}
