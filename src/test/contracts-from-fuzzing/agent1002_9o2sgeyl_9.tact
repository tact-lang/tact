struct MultiType {
    intField: Int;
    boolField: Bool;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
}

contract MultiFieldTest {
    item: MultiType;

    init() {
        self.item = MultiType{
            intField: 7,
            boolField: false,
            stringField: "hi",
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice()
        };
    }
}