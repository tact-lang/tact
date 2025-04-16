struct HasSlices {
    s1: Slice;
    s2: Slice;
}

contract SliceTest {
    st: HasSlices;

    init() {
        self.st = HasSlices{
            s1: emptyCell().asSlice(),
            s2: emptyCell().asSlice(),
        };
    }
}
