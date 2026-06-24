struct SliceCellAddr {
    s: Slice;
    c: Cell;
    a: Address;
}

contract ComboPrimitives {
    data: SliceCellAddr;
    init() {
        self.data = SliceCellAddr{ s: beginCell().endCell().asSlice(), c: emptyCell(), a: myAddress() };
    }
}
