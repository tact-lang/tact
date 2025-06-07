contract DiverseFields {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Address;
    f: Cell;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "s";
        self.d = emptyCell().asSlice();
        self.e = myAddress();
        self.f = emptyCell();
    }
}