struct SliceAndCellMix {
    s: Slice;
    c: Cell;
    str: String;
    flag: Bool;
    val: Int;
}

contract SliceCellFields {
    x: SliceAndCellMix;

    init() {
        self.x = SliceAndCellMix{
            s: emptyCell().asSlice(),
            c: emptyCell(),
            str: "abc",
            flag: true,
            val: 123
        };
    }
}