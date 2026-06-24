struct Flat {
    intfield: Int;
    boolfield: Bool;
    addrfield: Address;
    cellfield: Cell;
    slicefield: Slice;
    stringfield: String;
}

contract FlatStruct {
    data: Flat;

    init() {
        self.data = Flat{
            intfield: 10,
            boolfield: false,
            addrfield: myAddress(),
            cellfield: emptyCell(),
            slicefield: emptyCell().asSlice(),
            stringfield: "abc",
        };
    }
}