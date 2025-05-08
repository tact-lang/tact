struct VariousTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    slVal: Slice;
    cellVal: Cell;
    strVal: String;
}

contract MixedTypes {
    s: VariousTypes;

    init() {
        self.s = VariousTypes{
            intVal: 1,
            boolVal: false,
            addrVal: myAddress(),
            slVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            strVal: "test"
        };
    }
}