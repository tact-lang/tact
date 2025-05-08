struct VaryingTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
}

contract ManyTypesInStruct {
    d: VaryingTypes;
    init() {
        self.d = VaryingTypes{
            intVal: 1,
            boolVal: true,
            strVal: "testing",
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice()
        };
    }
}