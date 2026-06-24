struct MixedTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    addrVal: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optCell: Cell?;
    optAddr: Address?;
}

contract AllTypeFields {
    mix: MixedTypes;

    init() {
        self.mix = MixedTypes{
            intVal: 1,
            boolVal: false,
            strVal: "hi",
            cellVal: emptyCell(),
            addrVal: myAddress(),
            optInt: null,
            optBool: null,
            optStr: null,
            optCell: null,
            optAddr: null
        };
    }
}