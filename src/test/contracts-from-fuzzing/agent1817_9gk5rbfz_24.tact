struct RemainingSlice {
    prefix: Int as uint8;
    suffix: Slice as remaining;
}

contract RemainingSliceTest {
    data: RemainingSlice;

    init() {
        self.data = RemainingSlice{
            prefix: 42,
            suffix: emptyCell().asSlice(),
        };
    }
}
