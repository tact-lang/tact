struct VariousPrimitives {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
}

contract PrimitivesTest {
    field: VariousPrimitives;

    init() {
        self.field = VariousPrimitives{
            intVal: 42,
            boolVal: true,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            strVal: "hello",
        };
    }
}
