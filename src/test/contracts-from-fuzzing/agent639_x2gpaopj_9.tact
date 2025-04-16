struct Combo {
    intVal: Int;
    boolVal: Bool;
    sliceVal: Slice;
    cellVal: Cell;
    stringVal: String;
    addressVal: Address;
}

contract AllPrimitives {
    c: Combo;
    init() {
        self.c = Combo{
            intVal: 1,
            boolVal: false,
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            stringVal: "hi",
            addressVal: myAddress()
        };
    }
}