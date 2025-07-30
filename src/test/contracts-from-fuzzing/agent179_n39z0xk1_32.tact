struct WithRemaining {
    data: Slice as remaining;
}

contract RemainingInStruct {
    s: WithRemaining;
    init() {
        self.s = WithRemaining{ data: emptyCell().asSlice() };
    }
}