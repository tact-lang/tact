contract MixTypes {
    n: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;

    init() {
        self.n = 123;
        self.b = false;
        self.s = "Test";
        self.c = emptyCell();
        self.sl = self.c.asSlice();
        self.addr = myAddress();
    }
}
