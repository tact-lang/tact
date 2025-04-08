struct NestedSlices {
    s1: Slice;
    s2: Slice?;
    s3: Slice;
}

struct Slicer {
    nested: NestedSlices;
    optNested: NestedSlices?;
}

contract SlicerTest {
    storage: Slicer;

    init() {
        self.storage = Slicer{
            nested: NestedSlices{ s1: emptyCell().asSlice(), s2: null, s3: emptyCell().asSlice() },
            optNested: null
        };
    }
}