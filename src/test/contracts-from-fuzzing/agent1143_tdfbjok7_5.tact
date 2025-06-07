struct ManyTypes {
    intVal: Int;
    boolVal: Bool;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    stringVal: String;
    addressVal: Address;
}

contract ManyTypesContract {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            intVal: 12,
            boolVal: false,
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
            stringVal: "hello",
            addressVal: myAddress()
        };
    }
}