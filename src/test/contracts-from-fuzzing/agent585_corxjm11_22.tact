struct WithRemaining {
    x: Int;
    payload: Slice as remaining;
}

contract RemainingInStructVar {
    field: WithRemaining;

    init() {
        self.field = WithRemaining{ x:42, payload: emptyCell().asSlice() };
    }
}
