struct MixedFields {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
}

contract MixedFieldsContract {
    mixed: MixedFields;

    init() {
        self.mixed = MixedFields{
            intVal: 1,
            boolVal: false,
            strVal: "abc",
            addrVal: myAddress(),
            cellVal: emptyCell()
        };
    }
}