struct StructWithOptionalSlice {
    data: Slice?;
}

contract OptionalSliceStorage {
    s: StructWithOptionalSlice;

    init() {
        self.s = StructWithOptionalSlice{
            data: emptyCell().asSlice()
        };
    }
}
