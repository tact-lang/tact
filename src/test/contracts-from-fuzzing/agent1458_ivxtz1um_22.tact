struct StructWithSlices {
    slice1: Slice;
    slice2: Slice;
}

contract SliceFieldsContract {
    data: StructWithSlices;

    init() {
        let s: Slice = emptyCell().asSlice();
        self.data = StructWithSlices{ slice1: s, slice2: s };
    }
}