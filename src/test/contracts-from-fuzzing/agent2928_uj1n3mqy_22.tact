struct WithRemaining {
    data: Slice as remaining;
}

contract RemainingFieldStruct {
    s: WithRemaining;

    init() {
        self.s = WithRemaining{ data: emptyCell().asSlice() };
    }
}