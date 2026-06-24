struct SeveralTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    addrVal: Address;
    sliceVal: Slice;
}

contract Test {
    data: SeveralTypes;

    init() {
        self.data = SeveralTypes{
            intVal: 1,
            boolVal: true,
            strVal: "abc",
            cellVal: emptyCell(),
            addrVal: myAddress(),
            sliceVal: emptyCell().asSlice()
        };
    }
}