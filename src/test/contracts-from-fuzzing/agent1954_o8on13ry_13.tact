struct StructWithAllPrimitives {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    stringVal: String;
}

contract PrimStructHolder {
    myData: StructWithAllPrimitives;

    init() {
        self.myData = StructWithAllPrimitives{
            intVal: 42,
            boolVal: true,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
            stringVal: "hello",
        };
    }
}
