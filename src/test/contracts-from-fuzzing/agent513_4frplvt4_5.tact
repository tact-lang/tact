contract Test {
    foo: Int = 1;
    bar: Bool = true;
    baz: Address;
    s: Slice;
    c: Cell;
    b: Builder;
    str: String = "hello";

    init() {
        self.baz = myAddress();
        self.s = emptyCell().asSlice();
        self.c = emptyCell();
        self.b = beginCell();
    }

    receive() {}
}