struct RemainLast {
    num: Int as uint32;
    data: Slice as remaining;
}

contract RemainingStructTest {
    stuff: RemainLast;

    init() {
        self.stuff = RemainLast {
            num: 42,
            data: emptyCell().asSlice()
        };
    }
}