struct RemainingTest {
    prefix: Int as uint8;
    rest: Slice as remaining;
}

contract TestRemainingField {
    data: RemainingTest;

    init() {
        self.data = RemainingTest{
            prefix: 42,
            rest: emptyCell().asSlice()
        };
    }
}
