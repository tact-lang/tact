struct Compose {
    intVal: Int;
    addrVal: Address;
    strVal: String;
    boolVal: Bool;
    sliceVal: Slice;
    optStr: String?;
    optAddr: Address?;
}

contract Everything {
    fields: Compose;
    init() {
        self.fields = Compose{
            intVal: 5, addrVal: myAddress(), strVal: "test", boolVal: true,
            sliceVal: emptyCell().asSlice(), optStr: null, optAddr: null
        };
    }
}