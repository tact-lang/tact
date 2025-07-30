struct WithRemaining {
    field1: Int;
    data: Slice as remaining;
}

contract RemainingContract {
    thing: WithRemaining;

    init() {
        self.thing = WithRemaining{
            field1: 123,
            data: emptyCell().asSlice(),
        };
    }
}