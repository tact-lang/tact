contract Test {
    foo: Cell;
    bar: Slice;

    init() {
        self.foo = emptyCell();
        self.bar = emptyCell().asSlice();
    }
}