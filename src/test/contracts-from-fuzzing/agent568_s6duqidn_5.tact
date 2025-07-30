struct Combo {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;
    addressVal: Address;
}

contract MixedStorage {
    combo: Combo;

    init() {
        self.combo = Combo{
            intVal: 1,
            boolVal: false,
            strVal: "hello",
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            builderVal: beginCell(),
            addressVal: myAddress()
        };
    }
}