struct JustSlices {
    s1: Slice;
    s2: Slice;
    s3: Slice;
}

contract TestContract {
    slices: JustSlices;

    init() {
        let empty = emptyCell().asSlice();
        self.slices = JustSlices{
            s1: empty,
            s2: empty,
            s3: empty
        };
    }
}