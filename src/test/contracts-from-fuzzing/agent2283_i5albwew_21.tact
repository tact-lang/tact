struct RemainingTest {
    prefix: Int as uint8;
    suffix: Slice as remaining;
}

contract RemainingFieldContract {
    data: RemainingTest;

    init() {
        self.data = RemainingTest{
            prefix: 255,
            suffix: emptyCell().asSlice()
        };
    }
}
