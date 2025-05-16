struct NestedSlices {
    slice1: Slice;
    inner: SlicedInner;
}

struct SlicedInner {
    slice2: Slice;
    slice3: Slice;
}

contract SliceNest {
    data: NestedSlices;
    init() {
        self.data = NestedSlices{
            slice1: emptyCell().asSlice(),
            inner: SlicedInner{
                slice2: emptyCell().asSlice(),
                slice3: emptyCell().asSlice()
            }
        };
    }
}