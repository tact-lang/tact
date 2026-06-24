struct CompositePrimitives {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
}

contract TestContract {
    comp: CompositePrimitives;

    init() {
        self.comp = CompositePrimitives{
            intVal: 1,
            boolVal: true,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            strVal: "Hello"
        };
    }
}
