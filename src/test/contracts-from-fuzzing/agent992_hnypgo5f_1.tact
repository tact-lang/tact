contract TestContract {
    foo: Int;
    bar: Bool;
    baz: Address;
    s: Slice;
    b: Builder;
    c: Cell;
    str: String;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = myAddress();
        self.s = emptyCell().asSlice();
        self.b = beginCell();
        self.c = emptyCell();
        self.str = "test";
    }
}
