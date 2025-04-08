struct HasSlice {
    s: Slice;
}

struct HasSliceOpt {
    s: Slice?;
}

contract SliceTesting {
    a: HasSlice;
    b: HasSliceOpt;
    init() {
        self.a = HasSlice{ s: emptyCell().asSlice() };
        self.b = HasSliceOpt{ s: null };
    }
}