struct OptionalSliceStruct {
    sliceData: Slice?;
}

contract OptionalSliceInStruct {
    data: OptionalSliceStruct;

    init() {
        self.data = OptionalSliceStruct{ sliceData: null };
    }
}