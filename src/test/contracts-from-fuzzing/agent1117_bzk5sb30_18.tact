struct Strange {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String;
}

contract BigTypes {
    strange: Strange;

    init() {
        self.strange = Strange{
            intVal: 1,
            boolVal: true,
            addressVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            stringVal: "test"
        };
    }
}