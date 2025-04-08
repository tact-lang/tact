contract TestContract {
    foo: Int;
    bar: Bool;
    baz: Address;
    qux: Cell;
    flag: String;
    slc: Slice;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = myAddress();
        self.qux = emptyCell();
        self.flag = "hello";
        self.slc = emptyCell().asSlice();
    }

    receive() {}
}