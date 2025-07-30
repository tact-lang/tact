contract TestContract {
    foo: Int;
    bar: Bool;
    baz: String;
    addr: Address;
    data: Cell;
    slice: Slice;
    builder: Builder;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = "test";
        self.addr = myAddress();
        self.data = emptyCell();
        self.slice = self.data.asSlice();
        self.builder = beginCell();
    }
}
