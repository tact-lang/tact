struct Rec {
    intField: Int;
    boolField: Bool;
    stringField: String;
    addressField: Address?;
    sliceField: Slice;
    cellField: Cell;
}

contract Test {
    rec: Rec;
    init() {
        self.rec = Rec{
            intField: 42,
            boolField: true,
            stringField: "Hi",
            addressField: null,
            sliceField: emptyCell().asSlice(),
            cellField: emptyCell()
        };
    }
}