struct SepTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    sliceVal: Slice;
    cellVal: Cell;
    addrVal: Address;
}

contract SepTypesC {
    val: SepTypes;

    init() {
        self.val = SepTypes{
            intVal: 1,
            boolVal: true,
            strVal: "X",
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            addrVal: contractAddress(initOf SepTypesC())
        };
    }
}