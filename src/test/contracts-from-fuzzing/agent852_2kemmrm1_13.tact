struct WithRemainingOpt {
    id: Int as uint32;
    suffix: Slice?;
}

contract StructRemainingOptional {
    wr: WithRemainingOpt = WithRemainingOpt{
        id: 42,
        suffix: null
    };

    init() {
        self.wr = WithRemainingOpt{
            id: 100,
            suffix: emptyCell().asSlice()
        };
    }

    receive() {}
}