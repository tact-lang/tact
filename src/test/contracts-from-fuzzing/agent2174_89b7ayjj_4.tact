struct SerialTest {
    intVal: Int as uint32;
    boolVal: Bool;
    sliceVal: Slice;
    strVal: String;
    cellVal: Cell;
    addrVal: Address;
    optVal: Int?;
}

contract Serials {
    field: SerialTest;
    init() {
        self.field = SerialTest{
            intVal: 42,
            boolVal: true,
            sliceVal: emptyCell().asSlice(),
            strVal: "hey",
            cellVal: emptyCell(),
            addrVal: myAddress(),
            optVal: null
        };
    }
}
