struct S1 {
    c1: Cell;
    s: Slice;
    b: Builder;
}

contract TestContract {
    complex: S1;

    init() {
        self.complex = S1{
            c1: emptyCell(),
            s: emptyCell().asSlice(),
            b: beginCell()
        };
    }
}
