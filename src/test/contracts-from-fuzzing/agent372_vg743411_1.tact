contract Test {
    a: Int;
    b: Bool;
    c: Address;
    d: Slice;
    e: Builder;
    f: Cell;
    g: String;
    
    init() {
        self.a = 0;
        self.b = false;
        self.c = myAddress();
        self.d = emptyCell().asSlice();
        self.e = beginCell();
        self.f = emptyCell();
        self.g = "";
    }
}