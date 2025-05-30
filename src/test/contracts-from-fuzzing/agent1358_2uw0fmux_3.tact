contract OptionalFieldsTest {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    qux: Address?;
    cellOpt: Cell?;

    init() {
        self.foo = null;
        self.bar = true;
        self.baz = null;
        self.qux = myAddress();
        self.cellOpt = null;
    }
}