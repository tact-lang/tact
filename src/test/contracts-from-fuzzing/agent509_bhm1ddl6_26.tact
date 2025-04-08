struct SliceHolder {
    s: Slice?;
}

contract OptSliceInStruct {
    data: SliceHolder?;

    init() {
        self.data = null;
    }
}