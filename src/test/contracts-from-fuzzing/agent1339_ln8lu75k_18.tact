struct SliceNest {
    s1: Slice;
    s2: Slice?;
}

contract SliceFields {
    slices: SliceNest;

    init() {
        self.slices = SliceNest{
            s1: emptyCell().asSlice(),
            s2: null
        };
    }
}