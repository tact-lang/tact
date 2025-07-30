struct WithRemaining {
    val: Int;
    rest: Slice as remaining;
}

contract RemainingField {
    data: WithRemaining;

    init() {
        self.data = WithRemaining{
            val: 42,
            rest: emptyCell().asSlice(),
        };
    }
}
