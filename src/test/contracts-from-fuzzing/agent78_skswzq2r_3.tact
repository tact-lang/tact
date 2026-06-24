struct Mixed {
    intVal: Int;
    boolVal: Bool;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeStr: String?;
}

contract MultiTypeStorage {
    field: Mixed;

    init() {
        self.field = Mixed{
            intVal: 123,
            boolVal: true,
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            strVal: "Hello",
            maybeInt: null,
            maybeBool: false,
            maybeStr: null,
        };
    }
}