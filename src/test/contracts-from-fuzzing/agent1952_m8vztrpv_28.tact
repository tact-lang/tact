struct ChainSlices {
    s1: Slice;
    s2: Slice;
    s3: Slice;
}

contract TestContract {
    cs: ChainSlices;

    init() {
        self.cs = ChainSlices{
            s1: emptyCell().asSlice(),
            s2: emptyCell().asSlice(),
            s3: emptyCell().asSlice(),
        };
    }
}
