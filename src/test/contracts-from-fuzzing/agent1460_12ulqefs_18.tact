struct OneRemaining {
    x: Int;
    tail: Slice as remaining;
}

contract TestContract {
    data: OneRemaining;

    init() {
        self.data = OneRemaining{ x:1, tail: emptyCell().asSlice() };
    }
}