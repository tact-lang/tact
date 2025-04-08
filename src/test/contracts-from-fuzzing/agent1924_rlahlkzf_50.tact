struct RemainingTest {
    prefix: Int as uint8;
    rest: Slice as remaining;
}

contract TestContract {
    field: RemainingTest;

    init() {
        self.field = RemainingTest{
            prefix: 12,
            rest: emptyCell().asSlice()
        };
    }
}