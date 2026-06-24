contract OptionalPrimitiveDefaults {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
    addr: Address? = null;
    slice: Slice? = null;
    cell: Cell? = null;
    builder: Builder? = null;

    init() {
        self.a = 7;
        self.b = true;
        self.s = "ok";
        self.addr = myAddress();
        self.slice = emptyCell().asSlice();
        self.cell = emptyCell();
        self.builder = beginCell();
    }
}