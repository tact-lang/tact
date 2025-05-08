contract BadRemaining {
    extra: Slice as remaining;

    init() {
        self.extra = emptyCell().asSlice();
    }
}