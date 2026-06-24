struct RemainingSliceContainer {
    prefix: Int;
    suffix: Slice as remaining;
}

contract RemainingSliceField {
    val: RemainingSliceContainer;

    init() {
        self.val = RemainingSliceContainer{
            prefix: 123,
            suffix: emptyCell().asSlice()
        };
    }
}