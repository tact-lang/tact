struct WithRemaining {
    val: Int;
    extra: Slice as remaining;
}

contract RemainingFieldTest {
    data: WithRemaining;

    init() {
        self.data = WithRemaining{ val: 5, extra: emptyCell().asSlice() };
    }
}