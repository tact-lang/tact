struct LastRemaining {
    a: Int;
    rem: Slice as remaining;
}

contract TestContract {
    last: LastRemaining;

    init() {
        self.last = LastRemaining{
            a: 77,
            rem: emptyCell().asSlice()
        };
    }
}
