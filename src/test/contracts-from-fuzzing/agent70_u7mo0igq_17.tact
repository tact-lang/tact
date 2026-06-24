struct SliceCell {
    a: Slice;
    b: Cell;
    c: String;
}

contract TestContract {
    data: SliceCell;

    init() {
        self.data = SliceCell{
            a: "hello".asComment().asSlice(),
            b: emptyCell(),
            c: "world"
        };
    }
}