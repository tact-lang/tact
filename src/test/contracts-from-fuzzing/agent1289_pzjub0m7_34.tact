struct WithRemaining {
    count: Int as uint16;
    tail: Slice as remaining;
}

contract RemainingSliceStorage {
    info: WithRemaining;

    init() {
        self.info = WithRemaining{
            count: 5,
            tail: emptyCell().asSlice()
        };
    }
}