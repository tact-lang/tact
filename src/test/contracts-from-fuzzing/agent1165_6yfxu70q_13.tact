struct WithRemaining {
    id: Int;
    data: Slice as remaining;
}

contract RemainingSlice {
    segment: WithRemaining;

    init() {
        self.segment = WithRemaining{
            id: 10,
            data: emptyCell().asSlice(),
        };
    }
}
