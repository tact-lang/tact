struct WrapCellSlice {
    c: Cell;
    s: Slice;
}

struct DoubleWrap {
    w: WrapCellSlice;
}

contract NestedCells {
    d: DoubleWrap;

    init() {
        self.d = DoubleWrap{
            w: WrapCellSlice{
                c: emptyCell(),
                s: emptyCell().asSlice()
            }
        };
    }
}