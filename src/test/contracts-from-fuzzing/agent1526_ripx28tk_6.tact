struct MixedTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addrVal: Address;
    cellVal: Cell;
}

contract MixedTypesContract {
    mixed: MixedTypes;

    init() {
        self.mixed = MixedTypes{
            intVal: 1,
            boolVal: true,
            stringVal: "ok",
            addrVal: myAddress(),
            cellVal: emptyCell(),
        };
    }
}