contract EndingWithRemaining {
    n: Int;
    s: Slice as remaining;

    init() {
        self.n = 42;
        self.s = emptyCell().asSlice();
    }
}