contract ManyPredefineds {
    a: Address;
    c: Cell;
    sl: Slice;
    s: String;
    b: Bool;

    init() {
        self.a = myAddress();
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.s = "x";
        self.b = true;
    }
}