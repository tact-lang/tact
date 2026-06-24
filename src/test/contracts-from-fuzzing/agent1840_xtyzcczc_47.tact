struct WithSlice {
    s: Slice;
    c: Cell;
    st: String;
}

contract SliceMix {
    f: WithSlice;
    init() {
        self.f = WithSlice{ s: emptyCell().asSlice(), c: emptyCell(), st: "hi" };
    }
}