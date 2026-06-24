struct SliceHolder {
    sl: Slice;
}

contract SliceStructField {
    data: SliceHolder;

    init() {
        self.data = SliceHolder{ sl: emptyCell().asSlice() };
    }
}
