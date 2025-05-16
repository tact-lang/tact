struct ContainsRemaining {
    x: Int;
    rem: Slice as remaining;
}

contract RemainingTest {
    data: ContainsRemaining;
    init() {
        self.data = ContainsRemaining{
            x: 5,
            rem: emptyCell().asSlice()
        };
    }
}