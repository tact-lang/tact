struct Mixer {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract MixedDefaults {
    data: Mixer;
    init() {
        self.data = Mixer{
            intVal: 1,
            boolVal: true,
            strVal: "hey",
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            optInt: null,
            optBool: false,
            optStr: null
        };
    }
}