struct S {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addrVal: Address;
}

contract MixedTypes {
    data: S;

    init() {
        self.data = S{
            intVal: 1,
            boolVal: true,
            strVal: "abc",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            addrVal: myAddress(),
        };
    }
}