contract OptionalsManyTypes {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    addr: Address?;
    cell: Cell?;
    builder: Builder?;
    slice: Slice?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.addr = null;
        self.cell = null;
        self.builder = null;
        self.slice = null;
    }
}