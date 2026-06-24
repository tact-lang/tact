struct WithRemainingSlice {
    pre: Int as uint8;
    stuff: Slice as remaining;
}

contract StructWithRemaining {
    field: WithRemainingSlice;

    init() {
        self.field = WithRemainingSlice{
            pre: 7,
            stuff: emptyCell().asSlice()
        };
    }
}