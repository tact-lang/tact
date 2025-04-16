contract Test {
    foo: Int as uint8;
    bar: Int as int64;
    baz: Int as uint128;
    qux: Int;
    flag: Bool;
    text: String = "abc";
    optI: Int? = null;
    optAddr: Address? = null;
    optCell: Cell? = null;
    optSlice: Slice? = null;
    optText: String? = null;

    init() {
        self.foo = 7;
        self.bar = -12345;
        self.baz = 123456789;
        self.qux = 42;
        self.flag = true;
        self.text = "def";
        self.optI = 55;
        self.optAddr = myAddress();
        self.optCell = emptyCell();
        self.optSlice = emptyCell().asSlice();
        self.optText = "hello";
    }
}
