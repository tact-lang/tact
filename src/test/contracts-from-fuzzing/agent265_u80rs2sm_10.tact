struct SlicePair {
    s1: Slice;
    s2: Slice;
}

contract SliceStore {
    sp: SlicePair;

    init() {
        self.sp = SlicePair{
            s1: emptyCell().asSlice(),
            s2: emptyCell().asSlice()
        };
    }

    receive() {
        self.sp = self.sp;
    }
}