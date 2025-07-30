struct ManyPrimitives {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
}

contract SimplePrimitives {
    dat: ManyPrimitives;

    init() {
        self.dat = ManyPrimitives{
            intVal: 10,
            boolVal: true,
            strVal: "hello",
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell()
        };
    }
}
