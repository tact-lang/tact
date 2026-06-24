struct WithRemainder {
    prefix: Int as uint8;
    rest: Slice as remaining;
}

contract TestRemainder {
    data: WithRemainder;

    init() {
        self.data = WithRemainder{
            prefix: 255,
            rest: emptyCell().asSlice()
        };
    }
}