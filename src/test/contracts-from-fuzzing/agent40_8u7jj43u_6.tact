struct VariedTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
}

contract TestVariedTypes {
    data: VariedTypes;

    init() {
        self.data = VariedTypes{
            intVal: 1,
            boolVal: true,
            strVal: "ok",
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
        };
    }

    receive() {
        let tmp = self.data;
    }
}