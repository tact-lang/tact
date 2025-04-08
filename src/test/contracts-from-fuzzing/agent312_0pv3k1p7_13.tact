struct HasRemaining {
    someData: Int;
    tail: Slice as remaining;
}

contract CellTail {
    s: HasRemaining;

    init() {
        self.s = HasRemaining{
            someData: 42,
            tail: emptyCell().asSlice(),
        };
    }
}