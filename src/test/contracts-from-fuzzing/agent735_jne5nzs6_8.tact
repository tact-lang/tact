struct RemainingData {
    important: Int;
    extra: Slice as remaining;
}

contract RemainingFieldTest {
    s: RemainingData;

    init() {
        self.s = RemainingData{
            important: 42,
            extra: emptyCell().asSlice(),
        };
    }
}
