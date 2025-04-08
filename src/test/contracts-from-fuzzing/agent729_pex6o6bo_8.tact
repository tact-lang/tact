contract OptionalFields {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    adr: Address?;
    cel: Cell?;
    sli: Slice?;
    bld: Builder?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.adr = null;
        self.cel = null;
        self.sli = null;
        self.bld = null;
    }

    receive() {}
}