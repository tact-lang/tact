contract OptFields {
    num: Int?;
    txt: String?;
    addr: Address?;
    cell: Cell?;
    sl: Slice?;

    init() {
        self.num = null;
        self.txt = null;
        self.addr = null;
        self.cell = null;
        self.sl = null;
    }
}