struct SliceCellTuple {
    s: Slice;
    c: Cell;
    addr: Address;
}

contract MixedPrimitivesStruct {
    field: SliceCellTuple;

    init() {
        self.field = SliceCellTuple{
            s: emptySlice(),
            c: emptyCell(),
            addr: myAddress()
        };
    }
}