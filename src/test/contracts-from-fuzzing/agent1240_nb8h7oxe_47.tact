struct Slices {
    a: Slice;
    b: Slice?;
}

contract SliceFields {
    vals: Slices;
    init() {
        self.vals = Slices{
            a: emptyCell().asSlice(),
            b: null
        };
    }
}