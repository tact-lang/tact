struct NestedWithSliceCell {
    sli: Slice;
    cel: Cell;
}

struct OuterWrap {
    inside: NestedWithSliceCell;
}

contract NestedSliceCellField {
    var: OuterWrap;

    init() {
        self.var = OuterWrap{
            inside: NestedWithSliceCell{
                sli: emptyCell().asSlice(),
                cel: emptyCell(),
            }
        };
    }
}