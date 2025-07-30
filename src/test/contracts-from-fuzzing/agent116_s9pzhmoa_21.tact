contract ManyPrimitives {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    br: Builder;
    sl: Slice;

    init() {
        self.i = -100;
        self.b = true;
        self.s = "a";
        self.a = myAddress();
        self.c = emptyCell();
        self.br = beginCell();
        self.sl = emptyCell().asSlice();
    }
}