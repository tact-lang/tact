struct StructOfSlices {
    s1: Slice;
    s2: Slice;
    s3: Slice;
}

contract SliceFields {
    ss: StructOfSlices;

    init() {
        let c = emptyCell().asSlice();
        self.ss = StructOfSlices{
            s1: c,
            s2: c,
            s3: c
        };
    }
}
