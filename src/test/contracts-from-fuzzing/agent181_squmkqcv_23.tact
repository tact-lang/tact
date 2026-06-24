contract ManyPrimitivesPersist {
    pi: Int;
    pb: Bool;
    ps: String;
    pa: Address;
    pc: Cell;
    psl: Slice;

    init() {
        self.pi = 7;
        self.pb = true;
        self.ps = "hello";
        self.pa = myAddress();
        self.pc = emptyCell();
        self.psl = emptyCell().asSlice();
    }
}
