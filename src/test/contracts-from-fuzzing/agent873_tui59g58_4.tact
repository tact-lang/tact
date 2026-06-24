struct MixedTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    sliceVal: Slice;
    cellVal: Cell;
    addrVal: Address;
}

contract MixedPersistentFields {
    data: MixedTypes;
    
    init() {
        self.data = MixedTypes{
            intVal: 42,
            boolVal: true,
            strVal: "hi",
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            addrVal: myAddress()
        };
    }
}