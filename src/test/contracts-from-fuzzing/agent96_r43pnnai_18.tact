struct HasRemaining {
    prefix: Int;
    suffix: Slice as remaining;
}

contract StructWithRemaining {
    data: HasRemaining;

    init() {
        self.data = HasRemaining{
            prefix: 123,
            suffix: emptyCell().asSlice(),
        };
    }
}