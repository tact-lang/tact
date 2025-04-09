struct ContainsSlices {
    s1: Slice;
    s2: Slice?;
    s3: Slice;
}

contract SliceTest {
    data: ContainsSlices;

    init() {
        self.data = ContainsSlices{
            s1: emptyCell().asSlice(),
            s2: null,
            s3: emptyCell().asSlice()
        };
    }
}