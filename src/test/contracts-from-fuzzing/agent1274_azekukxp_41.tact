struct SliceHolder {
    s: Slice;
}

contract SliceAsPersistentField {
    val: SliceHolder;

    init() {
        self.val = SliceHolder {
            s: "abc".asComment().asSlice()
        };
    }
}