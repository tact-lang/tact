struct CellStruct {
    c1: Cell;
    c2: Cell;
}

struct SliceStruct {
    s1: Slice;
    s2: Slice;
}

contract TestStorage {
    data1: CellStruct;
    data2: SliceStruct;

    init() {
        let emptyC: Cell = emptyCell();
        let s: Slice = emptyC.asSlice();
        self.data1 = CellStruct{ c1: emptyC, c2: emptyC };
        self.data2 = SliceStruct{ s1: s, s2: s };
    }
}