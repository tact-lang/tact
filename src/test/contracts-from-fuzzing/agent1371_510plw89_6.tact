struct Varying {
    text1: String;
    text2: String;
    sl1: Slice;
    sl2: Slice;
    cell1: Cell;
    cell2: Cell;
}

contract BlobMix {
    blob: Varying;

    init() {
        self.blob = Varying{
            text1: "abc",
            text2: "def",
            sl1: emptyCell().asSlice(),
            sl2: emptyCell().asSlice(),
            cell1: emptyCell(),
            cell2: emptyCell()
        };
    }
}
