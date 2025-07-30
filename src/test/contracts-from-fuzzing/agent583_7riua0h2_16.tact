struct WithRemaining {
    a: Int;
    b: String;
    rest: Slice as remaining;
}

contract RemainingFieldContract {
    s: WithRemaining;

    init() {
        self.s = WithRemaining{
            a: 1,
            b: "hello",
            rest: beginCell().endCell().asSlice(),
        };
    }
}