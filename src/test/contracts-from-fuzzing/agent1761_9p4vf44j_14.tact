struct MixedOrdering {
    intBefore: Int;
    optAfter: Int?;
    boolBefore: Bool;
    strAfter: String?;
    sliceBefore: Slice;
    cellAfter: Cell;
}

contract TestContract {
    data: MixedOrdering;

    init() {
        self.data = MixedOrdering{
            intBefore: 1,
            optAfter: null,
            boolBefore: true,
            strAfter: null,
            sliceBefore: emptyCell().asSlice(),
            cellAfter: emptyCell()
        };
    }
}