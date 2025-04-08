struct OptionalSliceStruct {
    s: Slice?;
}

struct OptionalStringStruct {
    s: String?;
}

contract OptMixed {
    sliceStruct: OptionalSliceStruct;
    stringStruct: OptionalStringStruct;

    init() {
        self.sliceStruct = OptionalSliceStruct{ s: emptyCell().asSlice() };
        self.stringStruct = OptionalStringStruct{ s: null };
    }
}
