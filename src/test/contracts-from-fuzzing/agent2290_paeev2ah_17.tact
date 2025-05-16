struct HasCellSlice {
    c: Cell;
    s: Slice;
}

contract Test17 {
    val: HasCellSlice;

    init() {
        self.val = HasCellSlice{
            c: emptyCell(),
            s: emptyCell().asSlice()
        };
    }
}