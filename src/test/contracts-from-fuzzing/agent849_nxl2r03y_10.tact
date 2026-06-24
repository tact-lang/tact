contract TestContract {
    s: Slice as remaining;

    init() {
        self.s = emptyCell().asSlice();
    }
}