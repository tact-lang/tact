struct StructWithSlice {
    s: Slice;
    sOpt: Slice?;
}

contract SliceContract {
    rec: StructWithSlice;

    init() {
        self.rec = StructWithSlice{ s: emptyCell().asSlice(), sOpt: null };
    }
}