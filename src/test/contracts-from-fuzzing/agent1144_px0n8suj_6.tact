struct MixedTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    addrVal: Address;
    sl: Slice;
    builder: Builder;
}

contract MixedTypesContract {
    data: MixedTypes;

    init() {
        self.data = MixedTypes{
            intVal: 1,
            boolVal: true,
            strVal: "test",
            cellVal: emptyCell(),
            addrVal: myAddress(),
            sl: emptyCell().asSlice(),
            builder: beginCell()
        };
    }
}