struct Mixed {
    intVal: Int as uint32;
    boolVal: Bool;
    addrVal: Address?;
    sliceVal: Slice;
    cellVal: Cell?;
    strVal: String;
    flag: Bool?;
    bigInt: Int;
}

contract TestContract {
    mixed: Mixed;

    init() {
        self.mixed = Mixed{
            intVal: 1,
            boolVal: true,
            addrVal: null,
            sliceVal: emptyCell().asSlice(),
            cellVal: null,
            strVal: "hello",
            flag: null,
            bigInt: -42
        };
    }
}