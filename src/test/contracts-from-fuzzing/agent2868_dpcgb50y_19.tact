struct OptionalSlice {
    sl: Slice?;
}

contract OptSliceStorage {
    val: OptionalSlice;

    init() {
        self.val = OptionalSlice{};
    }
}