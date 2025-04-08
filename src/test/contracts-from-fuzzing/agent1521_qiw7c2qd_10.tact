struct HasRemaining {
    a: Int as uint8;
    rest: Slice as remaining;
}

contract RemainingFieldUsage {
    data: HasRemaining;

    init() {
        self.data = HasRemaining{
            a: 5,
            rest: emptyCell().asSlice(),
        };
    }
}