struct HasRemaining {
    prefix: Int as int8;
    suffix: Slice as remaining;
}

contract TestContract {
    data: HasRemaining;

    init() {
        self.data = HasRemaining{
            prefix: 5,
            suffix: emptyCell().asSlice(),
        };
    }
}
