struct HasRemaining {
    prefix: Int as uint8;
    suffix: Slice as remaining;
}

contract Test {
    d: HasRemaining;
    init() {
        self.d = HasRemaining{
            prefix: 123,
            suffix: emptyCell().asSlice()
        };
    }
}