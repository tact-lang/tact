contract Test {
    rem: Slice as remaining;

    init() {
        self.rem = emptyCell().asSlice();
    }
}