struct OptionalSliceStruct {
    s: Slice?;
}

contract OptionalSliceField {
    val: OptionalSliceStruct;

    init() {
        self.val = OptionalSliceStruct { s: null };
    }
}