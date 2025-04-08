contract TestContract {
    s: Slice?;

    init() {
        self.s = emptyCell().asSlice();
    }

    receive() {}
}