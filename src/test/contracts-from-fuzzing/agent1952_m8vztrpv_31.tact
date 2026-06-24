struct MixWithRemaining {
    a: Int;
    b: Slice as remaining;
}

contract TestContract {
    mwr: MixWithRemaining;

    init() {
        self.mwr = MixWithRemaining{
            a: 42,
            b: emptyCell().asSlice(),
        };
    }
}
