struct TestRemaining {
    prefix: Int as uint32;
    body: Slice as remaining;
}

contract RemainingFieldContract {
    d: TestRemaining;

    init() {
        self.d = TestRemaining{
            prefix: 12,
            body: emptyCell().asSlice()
        };
    }
}