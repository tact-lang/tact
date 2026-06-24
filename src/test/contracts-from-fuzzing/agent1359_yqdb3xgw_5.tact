struct Wide {
    intVal: Int;
    uintVal: Int as uint32;
    bigInt: Int as int257;
    smallInt: Int as int8;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
}

contract WideFields {
    storage: Wide;

    init() {
        self.storage = Wide{
            intVal: -42,
            uintVal: 123,
            bigInt: 999,
            smallInt: -7,
            boolVal: true,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            strVal: "hello",
        };
    }
}