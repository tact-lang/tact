struct MixedTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String;
}

contract MixedContract {
    m: MixedTypes;

    init() {
        self.m = MixedTypes{
            intVal: 1,
            boolVal: true,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            stringVal: "test",
        };
    }
}
