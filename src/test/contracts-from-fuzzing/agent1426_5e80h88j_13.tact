struct NestedPtrs {
    a: Slice;
    b: Cell;
    c: Builder;
}

struct Wrapper {
    p1: NestedPtrs;
    p2: NestedPtrs;
    p3: NestedPtrs;
}

contract PtrsContract {
    w: Wrapper;

    init() {
        let emptyC = emptyCell();
        let s = emptyC.asSlice();
        let b = beginCell();
        self.w = Wrapper{
            p1: NestedPtrs{ a:s, b:emptyC, c:b },
            p2: NestedPtrs{ a:s, b:emptyC, c:b },
            p3: NestedPtrs{ a:s, b:emptyC, c:b },
        };
    }
}