struct SliceOpts {
    s1: Slice?;
    s2: Slice?;
    s3: Slice?;
    s4: Slice?;
}

struct CellOpts {
    c1: Cell?;
    c2: Cell?;
    c3: Cell?;
    c4: Cell?;
}

contract OptSlicesCells {
    a: SliceOpts;
    b: CellOpts;

    init() {
        self.a = SliceOpts{s1:null,s2:null,s3:null,s4:null};
        self.b = CellOpts{c1:null,c2:null,c3:null,c4:null};
    }
}