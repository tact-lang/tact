struct HasRemaining {
    id: Int as uint32;
    extra: Slice as remaining;
}

contract RemainingTail {
    data: HasRemaining;

    init() {
        self.data = HasRemaining{
            id: 42,
            extra: emptyCell().asSlice()
        };
    }
}