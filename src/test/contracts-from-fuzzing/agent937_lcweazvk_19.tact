struct HasRemaining {
    prefix: Int;
    tail: Slice as remaining;
}

contract RemainingStructUse {
    s: HasRemaining;

    init() {
        self.s = HasRemaining{
            prefix: 5,
            tail: emptyCell().asSlice(),
        };
    }
}