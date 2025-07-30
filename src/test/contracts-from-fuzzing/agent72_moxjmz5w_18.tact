struct Mix {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addrVal: Address;
}

contract MixedFields {
    data: Mix;

    init() {
        self.data = Mix{
            intVal:1,
            boolVal:true,
            strVal:"mix",
            cellVal:emptyCell(),
            sliceVal:emptyCell().asSlice(),
            addrVal:myAddress()
        };
    }
}