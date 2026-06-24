struct SliceHolder {
    s: Slice;
}

contract SliceAsStorage {
    holder: SliceHolder;

    init() {
        self.holder = SliceHolder{
            s: "hello".asSlice(),
        };
    }
}
