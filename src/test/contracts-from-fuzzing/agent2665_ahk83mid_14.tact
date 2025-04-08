contract ZeroDefaults {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;

    init() {
        self.i = 0;
        self.b = false;
        self.s = "";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.a = myAddress();
    }
}