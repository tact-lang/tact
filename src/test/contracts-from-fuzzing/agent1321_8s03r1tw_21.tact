struct WithRemaining {
    preamble: Int;
    rest: Slice as remaining;
}

contract RemainderTest {
    d: WithRemaining;
    init() {
        self.d = WithRemaining{ preamble: 7, rest: emptyCell().asSlice() };
    }
}