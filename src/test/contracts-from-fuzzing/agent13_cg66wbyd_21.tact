struct HasRemaining {
    prefix: Int as uint32;
    suffix: Slice as remaining;
}

contract Test {
    data: HasRemaining;

    init() {
        self.data = HasRemaining{
            prefix:5,
            suffix: emptyCell().asSlice()
        };
    }
}
