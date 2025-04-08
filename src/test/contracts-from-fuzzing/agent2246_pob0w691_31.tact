struct VariousTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
}

contract FieldTypes {
    data: VariousTypes;

    init() {
        self.data = VariousTypes{
            intVal: 1,
            boolVal: true,
            addrVal: myAddress(),
            strVal: "hi",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell()
        };
    }
}
