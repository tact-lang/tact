// test struct with remaining slice
struct WithRemainder {
    a: Int;
    rest: Slice as remaining;
}

contract Test {
    w: WithRemainder;

    init() {
        self.w = WithRemainder{
            a: 5,
            rest: emptyCell().asSlice()
        };
    }
}