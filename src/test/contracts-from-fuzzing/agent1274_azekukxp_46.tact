struct OptionalSliceHolder {
    s: Slice?;
}

contract OptionalSlicePersistent {
    val: OptionalSliceHolder;

    init() {
        self.val = OptionalSliceHolder {
            s: null
        };
    }
}