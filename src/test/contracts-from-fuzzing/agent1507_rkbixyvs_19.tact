struct AllPrimitives {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;
}

contract PrimitivesTest {
    v: AllPrimitives;

    init() {
        self.v = AllPrimitives{
            intVal: 42,
            boolVal: true,
            addrVal: myAddress(),
            strVal: "hi",
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            builderVal: beginCell(),
        };
    }
}
