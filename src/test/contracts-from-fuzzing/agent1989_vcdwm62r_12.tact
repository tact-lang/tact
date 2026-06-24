struct SliceHolder {
    s: Slice;
    sOpt: Slice?;
}

contract SlicePersistent {
    sliceKeep: SliceHolder;

    init() {
        self.sliceKeep = SliceHolder{
            s: "Hi".asComment().asSlice(),
            sOpt: null,
        };
    }
}