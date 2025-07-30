struct Data {
    intField: Int;
    boolField: Bool;
    cellField: Cell;
    sliceField: Slice;
    addressField: Address;
    stringField: String;
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalCell: Cell?;
}

contract ManyTypes {
    data: Data;

    init() {
        self.data = Data{
            intField: 1,
            boolField: true,
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            addressField: myAddress(),
            stringField: "test",
            optionalInt: null,
            optionalBool: null,
            optionalCell: null
        };
    }
}