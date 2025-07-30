struct RemainTest {
    prefix: Int as uint8;
    tail: Slice as remaining;
}

contract RemainingTest {
    data: RemainTest;
    init() {
        self.data = RemainTest{ prefix: 42, tail: emptyCell().asSlice() };
    }
}