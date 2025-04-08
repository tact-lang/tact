struct HasSlices {
    s1: Slice;
    s2: Slice?;
}

contract SliceStore {
    data: HasSlices;

    init() {
        self.data = HasSlices{
            s1: emptyCell().asSlice(),
            s2: null
        };
    }
}