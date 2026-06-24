struct OptSliceStruct {
    data: Slice?;
}

contract OptionalSliceField {
    s: OptSliceStruct;

    init() {
        self.s = OptSliceStruct{ data: null };
    }
}