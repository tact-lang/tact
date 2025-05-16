struct MixedFields {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
}

contract MixedFieldsContract {
    saved: MixedFields;

    init() {
        self.saved = MixedFields{
            intVal:1, boolVal:true, stringVal:"abc", addrVal:myAddress(),
            cellVal:emptyCell(), sliceVal:emptyCell().asSlice()
        };
    }
}