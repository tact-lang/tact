contract ManyVars {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    adr: Address;
    bl: Builder;

    init() {
        self.i = 1;
        self.b = true;
        self.s = "x";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.adr = myAddress();
        self.bl = beginCell();
    }
}