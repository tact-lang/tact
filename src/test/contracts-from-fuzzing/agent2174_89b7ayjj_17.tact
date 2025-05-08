struct HasRemaining {
    a: Int;
    b: Slice as remaining;
}

contract RemainingDemo {
    f: HasRemaining;
    init() {
        self.f = HasRemaining{
            a: 123,
            b: emptyCell().asSlice()
        };
    }
}
