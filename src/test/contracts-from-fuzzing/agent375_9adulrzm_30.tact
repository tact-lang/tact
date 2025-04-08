contract OptionalDefaultsMixed {
    a: Int? = null;
    b: Bool? = true;
    c: String? = "abc";
    ce: Cell? = null;
    sl: Slice? = null;
    bu: Builder? = null;
    addr: Address? = null;

    init() {
        self.a = null;
        self.b = false;
        self.c = null;
        self.ce = emptyCell();
        self.sl = emptyCell().asSlice();
        self.bu = beginCell();
        self.addr = myAddress();
    }
}
