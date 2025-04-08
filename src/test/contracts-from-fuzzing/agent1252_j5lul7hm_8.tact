struct MixPrimitives {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addrVal: Address;
}

contract MixedContract {
    data: MixPrimitives;

    init() {
        self.data = MixPrimitives{
            intVal: 1,
            boolVal: true,
            strVal: "test",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            addrVal: myAddress()
        };
    }
}
