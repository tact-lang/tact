struct ComposeSlices {
    s1: Slice;
    s2: Slice;
    s3: Slice;
}

contract TestContract {
    data: ComposeSlices;

    init() {
        let s = emptyCell().asSlice();
        self.data = ComposeSlices{
            s1:s, s2:s, s3:s
        };
    }
}
