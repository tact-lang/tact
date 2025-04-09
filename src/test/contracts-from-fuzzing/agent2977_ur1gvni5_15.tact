contract ManyPrimitives {
    ai: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;

    init() {
        self.ai = 42;
        self.b = true;
        self.s = "hi";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.a = myAddress();
    }
}