struct WithRemaining {
    a: Int;
    b: Slice as remaining;
}

contract RemainingTest {
    payload: WithRemaining;

    init() {
        self.payload = WithRemaining{
            a: 123,
            b: emptyCell().asSlice(),
        };
    }
}