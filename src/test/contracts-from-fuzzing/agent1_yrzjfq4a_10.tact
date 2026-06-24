struct Mixed {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
    optInt: Int?;
    optBool: Bool?;
}

contract MixedStructStorage {
    m: Mixed;

    init() {
        self.m = Mixed{
            intField: 1,
            boolField: false,
            addrField: myAddress(),
            stringField: "abc",
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            optInt: null,
            optBool: true
        };
    }
}