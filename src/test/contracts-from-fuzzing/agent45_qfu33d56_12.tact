contract ManyPrimTypes {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    bl: Builder;

    init() {
        self.i = 7;
        self.b = true;
        self.s = "hi";
        self.a = myAddress();
        self.c = emptyCell();
        self.sl = self.c.asSlice();
        self.bl = beginCell();
    }
}