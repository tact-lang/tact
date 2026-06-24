struct ContainsRemaining {
    a: Int;
    s: Slice as remaining;
}

contract TestRemaining {
    data: ContainsRemaining;

    init() {
        self.data = ContainsRemaining {
            a: 1,
            s: emptyCell().asSlice()
        };
    }
}