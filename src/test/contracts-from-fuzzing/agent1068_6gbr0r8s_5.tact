struct Params {
    x: Int;
    y: Int;
    text: String;
    optionalStr: String?;
    optionalInt: Int?;
    sliceData: Slice;
    cellData: Cell;
}

contract ComplexFields {
    item: Params;

    init() {
        self.item = Params{
            x: 1,
            y: 2,
            text: "Hello",
            optionalStr: null,
            optionalInt: null,
            sliceData: emptyCell().asSlice(),
            cellData: emptyCell(),
        };
    }
}