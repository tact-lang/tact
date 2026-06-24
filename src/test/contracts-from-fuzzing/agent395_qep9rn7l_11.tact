struct RemainTest {
    a: Int as uint8;
    b: Int as uint64;
    c: Slice as remaining;
}

contract RemainingLast {
    data: RemainTest;

    init() {
        self.data = RemainTest{
            a: 255,
            b: 123456,
            c: emptyCell().asSlice()
        };
    }
}
