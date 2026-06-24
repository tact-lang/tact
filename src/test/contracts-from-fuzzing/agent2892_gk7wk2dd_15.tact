contract OptionalPrimitivesSimple {
    foo: Int?;
    bar: Bool?;
    addr: Address?;
    txt: String?;
    init() {
        self.foo = null;
        self.bar = null;
        self.addr = null;
        self.txt = null;
    }
}