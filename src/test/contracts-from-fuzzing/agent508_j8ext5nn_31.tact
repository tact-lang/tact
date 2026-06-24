contract JustSlice {
    s: Slice;

    init() {
        self.s = emptyCell().asSlice();
    }
}