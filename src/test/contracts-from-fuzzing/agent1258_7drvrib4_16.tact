struct SliceHolder {
    s: Slice;
}

struct WrapperWithOptional {
    inner: SliceHolder?;
}

contract SliceWithinNestedOptional {
    slot: WrapperWithOptional;

    init() {
        self.slot = WrapperWithOptional {
            inner: SliceHolder { s: emptyCell().asSlice() }
        };
    }
}