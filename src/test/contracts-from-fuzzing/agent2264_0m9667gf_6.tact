struct MixedTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String;
}

contract MixedTest {
    data: MixedTypes;

    init() {
        self.data = MixedTypes{
            intVal: 123,
            boolVal: true,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            stringVal: "test"
        };
    }
}
