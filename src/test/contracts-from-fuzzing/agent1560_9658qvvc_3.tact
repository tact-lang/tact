struct MultipleTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
}

contract MixedFields {
    data: MultipleTypes;
    init() {
        self.data = MultipleTypes{
            intVal: 10,
            boolVal: false,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            strVal: "hello",
        };
    }
}