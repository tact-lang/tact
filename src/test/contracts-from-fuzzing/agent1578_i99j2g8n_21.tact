struct HasRemaining {
    a: Int;
    rest: Slice as remaining;
}

contract TestContract {
    val: HasRemaining;

    init() {
        let c = emptyCell();
        self.val = HasRemaining{ a: 42, rest: c.asSlice() };
    }
}