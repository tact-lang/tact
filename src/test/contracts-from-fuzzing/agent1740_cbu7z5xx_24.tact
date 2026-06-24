struct WithRemaining {
    x: Int as uint32;
    rest: Slice as remaining;
}

contract RemainingContract {
    data: WithRemaining;

    init() {
        self.data = WithRemaining { x: 5, rest: emptyCell().asSlice() };
    }
}