struct ContainsRemaining {
    a: Int;
    body: Slice as remaining;
}

contract RemainingFieldTest {
    d: ContainsRemaining;

    init() {
        self.d = ContainsRemaining{
            a: 1,
            body: emptyCell().asSlice()
        };
    }
}
