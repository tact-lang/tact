struct OptionalSliceCellString {
    s: Slice?;
    c: Cell?;
    txt: String?;
}

contract OptionalComplexFields {
    data: OptionalSliceCellString;

    init() {
        self.data = OptionalSliceCellString{s: null, c: null, txt: null};
    }

    receive() {
        self.data = OptionalSliceCellString{
            s: emptyCell().asSlice(),
            c: emptyCell(),
            txt: "string"
        };
    }
}