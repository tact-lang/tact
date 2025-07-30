contract ManyPrimitives {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    bl: Builder;
    init() {
        self.i = 1;
        self.b = true;
        self.s = "str";
        self.a = myAddress();
        self.c = emptyCell();
        self.sl = self.c.asSlice();
        self.bl = beginCell();
    }
}