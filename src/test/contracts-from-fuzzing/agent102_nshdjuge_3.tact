contract OptionalFieldsTest {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    addr: Address?;
    cellVal: Cell?;

    init() {
        self.foo = null;
        self.bar = true;
        self.baz = null;
        self.addr = myAddress();
        self.cellVal = emptyCell();
    }
}
