struct SWithSlices {
    a: Slice;
    b: Slice?;
}

contract SliceStorageTest {
    s: SWithSlices;

    init() {
        self.s = SWithSlices {
            a: emptyCell().asSlice(),
            b: null
        };
    }
}