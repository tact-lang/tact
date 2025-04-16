contract ManyTypes {
    i: Int;
    b: Bool;
    addr: Address;
    s: String;
    c: Cell;
    sl: Slice;
    bl: Builder;

    init() {
        self.i = 5;
        self.b = true;
        self.addr = myAddress();
        self.s = "ok";
        self.c = emptyCell();
        self.sl = self.c.asSlice();
        self.bl = beginCell();
    }
}