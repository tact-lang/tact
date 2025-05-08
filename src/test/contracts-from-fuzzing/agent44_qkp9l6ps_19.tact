struct CombinedPrimitives {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
}

contract CombinedPrimitivesTest {
    data: CombinedPrimitives;

    init() {
        self.data = CombinedPrimitives{
            intVal: 5,
            boolVal: true,
            strVal: "hi",
            addrVal: myAddress(),
            sliceVal: emptySlice(),
            cellVal: emptyCell(),
        };
    }
}