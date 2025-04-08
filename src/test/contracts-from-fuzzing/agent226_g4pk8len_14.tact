struct RemainingTest {
    prefix: Int as uint32;
    rest: Slice as remaining;
}

contract RemainingStructField {
    data: RemainingTest;

    init() {
        self.data = RemainingTest{
            prefix: 1234,
            rest: emptyCell().asSlice()
        };
    }
}