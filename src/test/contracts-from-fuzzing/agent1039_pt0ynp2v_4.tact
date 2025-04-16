struct Mixed {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
    strVal: String;
}

contract TestContract {
    m: Mixed;

    init() {
        self.m = Mixed{
            intVal: 1,
            boolVal: false,
            addrVal: myAddress(),
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            strVal: "hello",
        };
    }
}