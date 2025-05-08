struct WrapSlice {
    data: Slice;
}

contract SliceStructField {
    val: WrapSlice;

    init() {
        self.val = WrapSlice{ data: emptyCell().asSlice() };
    }
}