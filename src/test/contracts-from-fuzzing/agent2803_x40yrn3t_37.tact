struct AllPrimitiveTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
}

contract ContractAllPrimitives {
    content: AllPrimitiveTypes;

    init() {
        self.content = AllPrimitiveTypes{
            intVal: 5,
            boolVal: true,
            strVal: "x",
            addrVal: myAddress(),
            sliceVal: emptySlice(),
            cellVal: emptyCell()
        };
    }
}