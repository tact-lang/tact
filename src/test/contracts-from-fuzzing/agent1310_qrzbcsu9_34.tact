struct MixPrimitives {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
}

contract MixPrimContract {
    s: MixPrimitives;
    init() {
        self.s = MixPrimitives{
            intVal: 1,
            boolVal: false,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            strVal: "str"
        };
    }
}