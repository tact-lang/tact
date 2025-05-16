struct Combination {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addrVal: Address;
    cellVal: Cell;
    optIntVal: Int?;
    optBoolVal: Bool?;
}

contract CombinedStructFields {
    combo: Combination;

    init() {
        self.combo = Combination{
            intVal: 77,
            boolVal: false,
            stringVal: "hi",
            addrVal: myAddress(),
            cellVal: emptyCell(),
            optIntVal: null,
            optBoolVal: null
        };
    }
}