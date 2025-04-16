struct SliceAndBool {
    s: Slice;
    b: Bool;
}

contract TestSliceBool {
    data: SliceAndBool;

    init() {
        self.data = SliceAndBool {
            s: emptyCell().asSlice(),
            b: false
        };
    }
}
