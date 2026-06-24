struct TestStruct {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String;
}

contract SampleContract {
    s: TestStruct;

    init() {
        self.s = TestStruct{
            intVal: 1,
            boolVal: true,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            stringVal: "Hello"
        };
    }
}