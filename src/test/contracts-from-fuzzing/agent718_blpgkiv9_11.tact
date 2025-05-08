contract LargestPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
    g: Builder;
    init() {
        self.a = 0;
        self.b = false;
        self.c = "";
        self.d = emptyCell();
        self.e = myAddress();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
    }
}