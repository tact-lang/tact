struct HasRemaining {
    fixed: Int;
    tail: Slice as remaining;
}

contract StructRemainingField {
    info: HasRemaining;

    init() {
        self.info = HasRemaining{
            fixed: 1,
            tail: emptyCell().asSlice()
        };
    }
}