contract OnlyOptionals {
    foo: Int?;
    bar: String?;
    baz: Address?;
    qux: Cell?;
    quux: Slice?;
    flag: Bool?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.qux = null;
        self.quux = null;
        self.flag = null;
    }
}