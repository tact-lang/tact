struct CellNest {
    foo: Cell;
    bar: Slice;
}

struct WrapCell {
    nested: CellNest;
    flag: Bool;
}

contract CellStructFields {
    cstruct: WrapCell;

    init() {
        self.cstruct = WrapCell{
            nested: CellNest{
                foo: emptyCell(),
                bar: emptyCell().asSlice()
            },
            flag: true
        };
    }
}