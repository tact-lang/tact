struct WithRemaining {
    important: Int;
    extra: Slice as remaining;
}

contract RemainingField {
    data: WithRemaining;

    init() {
        self.data = WithRemaining{
            important: 99,
            extra: emptyCell().asSlice(),
        };
    }
}