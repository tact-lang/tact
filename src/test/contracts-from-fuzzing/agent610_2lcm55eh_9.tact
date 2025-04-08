struct LargePrimitiveMix {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;
    addrVal: Address;
}

contract LargePrimitiveTest {
    data: LargePrimitiveMix;

    init() {
        self.data = LargePrimitiveMix{
            intVal: 42,
            boolVal: true,
            strVal: "ton",
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            builderVal: beginCell(),
            addrVal: myAddress()
        };
    }
}