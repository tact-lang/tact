struct Mix {
    intVal: Int;
    boolVal: Bool;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    strVal: String;
}

contract MixedTypes {
    store: Mix;
    init() {
        self.store = Mix{
            intVal: 123,
            boolVal: true,
            addr: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
            strVal: "test"
        };
    }
}