contract ChainedMix {
    a: Int? = null;
    b: Bool;
    c: String?;
    d: Cell;
    e: Slice?;
    f: Address;

    init() {
        self.b = true;
        self.c = null;
        self.d = emptyCell();
        self.e = null;
        self.f = myAddress();
    }
}