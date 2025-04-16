struct InnerS {
    s: Slice;
    c: Cell;
    a: Address;
}

contract StructWithSliceCellAddr {
    inner: InnerS;

    init() {
        self.inner = InnerS{
            s: emptyCell().asSlice(),
            c: emptyCell(),
            a: myAddress(),
        };
    }
}