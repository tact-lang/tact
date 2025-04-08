contract MultiPersistence {
    number: Int;
    flag: Bool;
    text: String;
    addr: Address;
    codeCell: Cell;
    bits: Slice;
    build: Builder;
    valOpt: Int?;

    init() {
        self.number = 0;
        self.flag = false;
        self.text = "";
        self.addr = myAddress();
        self.codeCell = emptyCell();
        self.bits = emptyCell().asSlice();
        self.build = beginCell();
        self.valOpt = null;
    }
}
