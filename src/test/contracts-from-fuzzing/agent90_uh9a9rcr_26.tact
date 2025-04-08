struct AllPrims {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;
    addressVal: Address;
}

contract AllPrimsContract {
    data: AllPrims;
    init() {
        self.data = AllPrims{
            intVal: 1,
            boolVal: true,
            stringVal: "hi",
            cellVal: emptyCell(),
            builderVal: beginCell(),
            sliceVal: emptyCell().asSlice(),
            addressVal: myAddress()
        };
    }
}