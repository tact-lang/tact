struct ContainsRemaining {
    a: Int;
    b: Slice as remaining;
}

contract RemainingInStruct {
    s: ContainsRemaining;

    init() {
        self.s = ContainsRemaining{a: 1, b: emptyCell().asSlice()};
    }
}