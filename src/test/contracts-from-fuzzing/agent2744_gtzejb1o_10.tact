struct MixedPrimitives {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addrVal: Address;
}

contract MixedSerializationContract {
    data: MixedPrimitives;

    init() {
        self.data = MixedPrimitives{
            intVal: 123,
            boolVal: true,
            strVal: "test",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            addrVal: myAddress()
        };
    }
}
