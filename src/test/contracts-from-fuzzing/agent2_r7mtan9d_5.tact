struct MixedTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    addressVal: Address;
}

contract TestContract {
    data: MixedTypes;

    init() {
        self.data = MixedTypes{
            intVal: 1,
            boolVal: true,
            stringVal: "test",
            cellVal: emptyCell(),
            addressVal: myAddress(),
        };
    }
}