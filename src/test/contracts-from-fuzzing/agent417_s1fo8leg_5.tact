contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: String = "x";
    e: Cell;
    f: Slice;
    g: Int = -1;
    h: Bool = false;
    i: Address;
    j: String = "y";
    k: Cell;
    l: Slice;
    
    init() {
        self.c = myAddress();
        self.i = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.k = emptyCell();
        self.l = emptyCell().asSlice();
    }
}