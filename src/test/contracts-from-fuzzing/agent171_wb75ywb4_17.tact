contract EmptyDefault {
    foo: Int?;
    bar: Bool?;
    s: String?;
    addr: Address?;

    init() {
        self.foo = null;
        self.bar = null;
        self.s = null;
        self.addr = null;
    }
}