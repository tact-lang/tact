contract TestContract {
    foo: Int;
    bar: Bool;
    baz: Address;
    qux: Cell;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = myAddress();
        self.qux = emptyCell();
    }

    receive() {
        let x = self.foo + 1;
    }
}