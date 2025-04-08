struct DifferentTypes {
    intF: Int;
    boolF: Bool;
    stringF: String;
    sliceF: Slice;
    cellF: Cell;
    addressF: Address;
}

contract Test {
    var: DifferentTypes;

    init() {
        self.var = DifferentTypes {
            intF: 1,
            boolF: false,
            stringF: "str",
            sliceF: emptyCell().asSlice(),
            cellF: emptyCell(),
            addressF: myAddress()
        };
    }
}