contract Test16 {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;

    init() {
        self.a=0; self.b=true; self.c="yo";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }
}