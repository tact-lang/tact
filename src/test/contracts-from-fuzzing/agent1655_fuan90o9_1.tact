contract TestContract {
    foo: Int;
    bar: String;
    baz: Bool;
    addr: Address;
    data: Cell;

    init() {
        self.foo = 0;
        self.bar = "";
        self.baz = false;
        self.addr = myAddress();
        self.data = emptyCell();
    }
}
