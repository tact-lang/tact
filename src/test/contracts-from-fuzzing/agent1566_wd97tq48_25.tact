struct SliceInStruct {
    s: Slice;
}

struct HoldsSliceOpt {
    sOpt: Slice?;
}

contract SliceNestedTest {
    s1: SliceInStruct;
    s2: HoldsSliceOpt;

    init() {
        self.s1 = SliceInStruct{ s: emptyCell().asSlice() };
        self.s2 = HoldsSliceOpt{ sOpt: null };
    }
}
