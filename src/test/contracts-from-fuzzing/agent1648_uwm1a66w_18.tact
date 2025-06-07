struct SliceNest {
    s1: Slice;
    s2: Slice?;
}

contract SlicesInside {
    d: SliceNest;

    init() {
        let cell = emptyCell();
        let sl = cell.asSlice();

        self.d = SliceNest{
            s1: sl,
            s2: null
        };
    }
}