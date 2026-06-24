struct HasCellSliceString {
    a: Cell;
    b: Slice;
    c: String;
    d: Bool;
}

contract TestContract {
    data: HasCellSliceString;

    init() {
        self.data = HasCellSliceString {
            a: emptyCell(),
            b: emptyCell().asSlice(),
            c: "test",
            d: true
        };
    }
}