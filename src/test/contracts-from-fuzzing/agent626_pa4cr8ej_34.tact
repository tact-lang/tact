struct CBStruct {
    c: Cell;
    s: Slice;
    b: Builder;
}

contract CellSubTypes {
    x: CBStruct;

    init() {
        self.x = CBStruct{
            c: emptyCell(),
            s: emptyCell().asSlice(),
            b: beginCell()
        };
    }
}