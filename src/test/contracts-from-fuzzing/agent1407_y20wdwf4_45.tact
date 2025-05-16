struct FakeEmpty {
    rem: Slice as remaining;
}

contract TestBad {
    f: FakeEmpty;

    init() {
        self.f = FakeEmpty{ rem: emptyCell().asSlice() };
    }
}