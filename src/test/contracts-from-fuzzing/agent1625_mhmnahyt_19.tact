struct MultiTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addrVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
}

contract MixedFields {
    s: MultiTypes;

    init() {
        self.s = MultiTypes{
            intVal: 5,
            boolVal: false,
            stringVal: "hello",
            addrVal: myAddress(),
            sliceVal: "abc".asSlice(),
            cellVal: emptyCell(),
        };
    }
}
