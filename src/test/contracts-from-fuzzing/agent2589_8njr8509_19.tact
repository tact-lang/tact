struct WithRemaining {
    x: Int;
    rest: Slice as remaining;
}

contract RemainingStruct {
    data: WithRemaining;

    init() {
        self.data = WithRemaining {
            x: 10,
            rest: emptyCell().asSlice(),
        };
    }
}