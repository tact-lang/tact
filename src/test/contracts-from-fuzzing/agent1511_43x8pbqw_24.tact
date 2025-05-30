contract OnlyPrimitives {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
    d: Cell;
    e: Slice;
    f: Address;
    
    init() {
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
    }
}