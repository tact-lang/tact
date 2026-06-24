contract OptFields {
    foo: Int?;
    bar: String?;
    data: Cell?;
    flag: Bool?;
    addr: Address?;
    init() {
        self.foo = null;
        self.bar = null;
        self.data = null;
        self.flag = null;
        self.addr = null;
    }
}