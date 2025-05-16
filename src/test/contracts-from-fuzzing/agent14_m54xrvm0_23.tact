struct WithRemainder {
    header: Int as uint32;
    chunk: Slice as remaining;
}

contract Test23 {
    store: WithRemainder;

    init() {
        self.store = WithRemainder{
            header: 100,
            chunk: emptyCell().asSlice()
        };
    }
}
