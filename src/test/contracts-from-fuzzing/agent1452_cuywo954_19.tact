struct SliceMix {
    s1: Slice;
    s2: Slice?;
    s3: Slice;
    s4: Slice?;
}

contract SliceStorage {
    data: SliceMix;

    init() {
        let sl = emptyCell().asSlice();
        self.data = SliceMix{
            s1: sl,
            s2: null,
            s3: sl,
            s4: null
        };
    }
}
