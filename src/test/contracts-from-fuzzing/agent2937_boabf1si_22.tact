contract OnlyRemainingField {
    data: Slice as remaining;

    init() {
        self.data = emptyCell().asSlice();
    }
}