contract SlotTypes {
    i: Int;
    b: Bool;
    s: String;
    opti: Int?;
    opts: String?;
    optb: Bool?;
    cell: Cell;
    addr: Address;

    init() {
        self.i = 5;
        self.b = false;
        self.s = "test";
        self.opti = null;
        self.opts = null;
        self.optb = null;
        self.cell = emptyCell();
        self.addr = myAddress();
    }
}