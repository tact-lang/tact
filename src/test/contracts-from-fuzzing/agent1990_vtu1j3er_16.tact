contract MultiTypes {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;

    init() {
        self.i = -1;
        self.b = true;
        self.s = "multi";
        self.a = myAddress();
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}
