contract TestContract {
    foo: Int; bar: Bool; baz: String;
    qux: Int?; corge: Bool?; grault: String?;
    garply: Address?; waldo: Cell?; fred: Slice?;

    init() {
        self.foo = 1;
        self.bar = false;
        self.baz = "hello";
        self.qux = null;
        self.corge = true;
        self.grault = null;
        self.garply = myAddress();
        self.waldo = emptyCell();
        self.fred = emptyCell().asSlice();
    }
}