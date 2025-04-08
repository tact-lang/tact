contract TestContract {
    foo: Int;
    bar: Bool;
    baz: String;
    addr: Address;
    cel: Cell;
    sl: Slice;
    builder: Builder;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = "hello";
        self.addr = myAddress();
        self.cel = emptyCell();
        self.sl = emptyCell().asSlice();
        self.builder = beginCell();
    }

    receive() {}
}