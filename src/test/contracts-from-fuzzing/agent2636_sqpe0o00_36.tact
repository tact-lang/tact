struct RemainingLast {
    x: Int;
    rest: Slice as remaining;
}

contract RemainTest {
    r: RemainingLast;

    init() {
        self.r = RemainingLast{
            x: 42,
            rest: emptyCell().asSlice(),
        };
    }
}