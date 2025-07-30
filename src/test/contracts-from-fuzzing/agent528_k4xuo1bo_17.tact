struct WithRemaining {
    x: Int;
    payload: Slice as remaining;
}

contract TestContract {
    w: WithRemaining;
    init() {
        self.w = WithRemaining{x: 7, payload: emptyCell().asSlice()};
    }
}