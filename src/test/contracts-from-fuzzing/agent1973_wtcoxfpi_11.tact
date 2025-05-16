contract AllPrimitives {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    a: Address;

    init() {
        self.i = 1;
        self.b = true;
        self.s = "test";
        self.c = emptyCell();
        self.sl = slice("te6cckEBAQEAAgAAAEysuc0=");
        self.bu = beginCell();
        self.a = myAddress();
    }
}
