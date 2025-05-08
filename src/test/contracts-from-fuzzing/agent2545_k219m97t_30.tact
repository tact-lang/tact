contract ManyPrimitiveTypes {
    i: Int;
    b: Bool;
    a: Address;
    s: String;
    c: Cell;
    sl: Slice;
    bl: Builder;

    init() {
        self.i = 1;
        self.b = true;
        self.a = myAddress();
        self.s = "string";
        self.c = emptyCell();
        self.sl = self.c.asSlice();
        self.bl = beginCell();
    }
}
