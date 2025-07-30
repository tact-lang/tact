struct HasSlice {
    s: Slice;
    c: Cell;
}

contract Test {
    data: HasSlice;
    init() {
        self.data = HasSlice{
            s: emptyCell().asSlice(),
            c: emptyCell(),
        };
    }
}