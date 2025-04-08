contract MultiOptional {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    addr: Address?;
    slice: Slice?;
    cell: Cell?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.addr = null;
        self.slice = null;
        self.cell = null;
    }
}