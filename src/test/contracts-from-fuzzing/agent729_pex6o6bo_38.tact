contract OptionalSlices {
    foo: Slice?;
    bar: Slice;
    init() {
        self.foo = null;
        self.bar = emptyCell().asSlice();
    }
    receive() {}
}