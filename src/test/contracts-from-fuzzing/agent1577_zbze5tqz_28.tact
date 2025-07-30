contract TestContract {
    foo: Slice as remaining;
    init() {
        self.foo = emptyCell().asSlice();
    }
}