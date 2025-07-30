struct Aggregate {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    addressVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;
    stringVal: String;
}

contract AggregateField {
    data: Aggregate;

    init() {
        self.data = Aggregate{
            intVal: 1,
            boolVal: true,
            optInt: null,
            addressVal: myAddress(),
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            builderVal: beginCell(),
            stringVal: "text"
        };
    }
}