struct RemainSlice {
    prefix: Int as uint8;
    suffix: Slice as remaining;
}

contract RemainingSliceTest {
    data: RemainSlice;

    init() {
        self.data = RemainSlice{
            prefix: 1,
            suffix: emptyCell().asSlice()
        };
    }
}
