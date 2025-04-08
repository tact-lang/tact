contract TestContract {
    foo: Int;
    bar: Bool;
    baz: String;
    qux: Address;
    bin: Cell;
    slice: Slice;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = "test";
        self.qux = myAddress();
        self.bin = emptyCell();
        self.slice = self.bin.asSlice();
    }
}