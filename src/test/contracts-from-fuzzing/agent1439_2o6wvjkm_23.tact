struct HasRemaining {
    prefix: Int as uint32;
    suffix: Slice as remaining;
}

contract RemainingField {
    r: HasRemaining;
    init() {
        self.r = HasRemaining{prefix:10, suffix: emptyCell().asSlice()};
    }
}