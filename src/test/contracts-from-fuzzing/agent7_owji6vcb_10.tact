struct WithRef {
    c: Cell;
    s: Slice;
    b: Builder;
}

contract Test {
    data: WithRef;
    init() {
        self.data = WithRef{
            c: emptyCell(),
            s: emptyCell().asSlice(),
            b: beginCell()
        };
    }
}