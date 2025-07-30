struct HasRemaining {
    prefix: Int as uint16;
    suffix: Slice as remaining;
}

contract TestContract {
    rem: HasRemaining;

    init() {
        self.rem = HasRemaining{
            prefix: 42,
            suffix: emptyCell().asSlice()
        };
    }
}