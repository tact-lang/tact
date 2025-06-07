struct Cellish {
    str: String;
    slice: Slice;
    cell: Cell;
}

contract CellLikeFields {
    data: Cellish;

    init() {
        self.data = Cellish{
            str: "fun",
            slice: emptyCell().asSlice(),
            cell: emptyCell(),
        };
    }
}