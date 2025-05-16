struct SliceHolder {
    sliceData: Slice;
}

contract SliceStorage {
    data: SliceHolder;

    init() {
        self.data = SliceHolder{
            sliceData: emptyCell().asSlice(),
        };
    }
}
