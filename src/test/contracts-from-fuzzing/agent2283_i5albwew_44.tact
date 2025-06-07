struct LastRemaining {
    a: Int;
    rest: Slice as remaining;
}

contract LastRemainingContract {
    d: LastRemaining;

    init() {
        self.d = LastRemaining{
            a: 42,
            rest: emptyCell().asSlice()
        };
    }
}
