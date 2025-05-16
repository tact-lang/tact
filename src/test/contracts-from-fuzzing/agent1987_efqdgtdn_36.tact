struct HasRemaining {
    a: Int;
    rest: Slice as remaining;
}

contract RemainingField {
    data: HasRemaining;
    init() {
        self.data = HasRemaining{a:1,rest:emptyCell().asSlice()};
    }
}